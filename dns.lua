require "luasql.mysql"

IPLIST={}
TEMP={}
FLAG=999

--iprange check
function iprange(range ,ip)

        mask = newNetmask(range)
        return mask:match(ip)
end

--array copy
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--contains
function has_value (arr, val)

        for index, value in ipairs(arr) do

                local status, retval = pcall(iprange,value, val);

                if status then
                        if retval then
                                return true
                        end
                end
        end

        return false
end

--split
function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function dataSelect()

        TEMP={}
        --IPLIST={}
        env = luasql.mysql()
        --db, user, password, host, port
        conn = env:connect("powerdns","pdns", "pdnspassword2018", "localhost", 3306)
        
        query = "SELECT site_ip "
        query = query.."FROM site_list "
	
        cur = conn:execute(query)
        row = cur:fetch({},"a")
        whileCnt=1

        while row do
                if string.match(string.format(row.site_ip),"|") then
			local split = mysplit (string.format(row.site_ip), "|")		
			for i=1, #split do
				--IPLIST[whileCnt]=split[i]
				TEMP[whileCnt]=split[i]
				whileCnt=whileCnt+1
			end
		else
			--IPLIST[whileCnt]=string.format(row.site_ip)
			TEMP[whileCnt]=string.format(row.site_ip)
                	whileCnt=whileCnt+1
                end
		row = cur:fetch (row, "a")
        end

	cur:close()
	conn:close()
	env:close()

	IPLIST={}
	IPLIST=deepcopy(TEMP)
	
end

if FLAG == 999 then
	--print("flag")
	local ts = os.time()
	local curTime = os.date('%H', ts)
	FLAG = tonumber(curTime)
	dataSelect()
end

function timeSelect() 
	
	local ts = os.time()
	local curTime = os.date('%H', ts)
	--local curTime = os.date('%S', ts)
	
	if curTime ~= FLAG then
		--print("timeCheck")
		FLAG = tonumber(curTime)
		dataSelect()
	end
end

function postresolve(dq)
	--print("iplisti: "..#IPLIST)	
	
	timeSelect()
        local records = dq:getRecords()
	
	for k,v in pairs(records) do
                if v.type == pdns.A and not has_value(IPLIST, v:getContent()) then
			--local aa = dq.localaddr:toString()
			--local bb = dq.remoteaddr:toString()
			pdnslog(("Unauthorative Domain=" .. dq.qname:toString()), pdns.loglevels.Warn)
			v:changeContent("221.148.184.150")
                        v.ttl=1
                end
        end

        dq:setRecords(records)
        return true
end

