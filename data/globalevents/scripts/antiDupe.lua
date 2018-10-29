tablesToCheck = {"player_items", "player_depotitems", "tile_items", {"player_items", {"player_depotitems", "tile_items"}}, {"player_depotitems", "tile_items"}}
itemsToCheck = {7426,7429,7889,8866,8929,12574,3982,2531,2504,2501,2438,7438,2342,7894,8872,2519,2488,2487,2491}
function onStartup()
                local text, final = "", ""
                local filex = "data/logs/duplicated.txt"
                local f = io.open(filex, "a+")
                local count = 0
                for i = 1, table.maxn(tablesToCheck) do
                                for _, item in ipairs(itemsToCheck) do
                                                if type(tablesToCheck[i]) == "string" then
                                                                local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[i] .. " WHERE itemtype = " .. item .. " AND SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[i] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 1)")
                                                                if query:getID() ~= -1 then
                                                                                while(true) do
                                                                                                local delete = db.executeQuery("delete from " .. tablesToCheck[i] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. " and player_id = " .. query:getDataInt("player_id") .. ";")
                                                                                                text = "[!] -> Deleting items with duplicated serial from '" .. tablesToCheck[i] .. "': [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
                                                                                                count = (delete and count + 1 or count)
                                                                                                final = final .. (final ~= "" and "\n" or "") .. text
                                                                                                print(text)
                                                                                                if not query:next() then break end
                                                                                end
                                                                end
                                                else
                                                                if type(tablesToCheck[i][2]) == "string" then
                                                                                local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[i][1] .. " WHERE itemtype = " .. item .. " AND SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[i][2] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
                                                                                if query:getID() ~= -1 then
                                                                                                while(true) do
                                                                                                                local query_ = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[i][2] .. " WHERE itemtype = " .. item .. " AND SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[i][1] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
                                                                                                                local delete = db.executeQuery("delete from " .. tablesToCheck[i][1] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
                                                                                                                count = (delete and count + 1 or count)
                                                                                                                local delete2 = db.executeQuery("delete from " .. tablesToCheck[i][2] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
                                                                                                                count = (delete2 and count + 1 or count)
                                                                                                                text = "[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][1] .. "' [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!") ..
                                                                                                                "\n[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][2] .. "' [Player: " .. getPlayerNameByGUID(query_:getDataInt("player_id")) .. ", Item: " .. query_:getDataInt("itemtype") .. ", Count: " .. query_:getDataInt("count") .. ", Serial: " .. query_:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
                                                                                                                final = final .. (final ~= "" and "\n" or "") .. text
                                                                                                                print(text)
                                                                                                                if not query:next() then break end
                                                                                                end
                                                                                end
                                                                else
                                                                                for j = 1, #tablesToCheck[i][2] do
                                                                                                local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[i][1] .. " WHERE itemtype = " .. item .. " AND SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[i][2][j] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
                                                                                                if query:getID() ~= -1 then
                                                                                                                while(true) do
                                                                                                                                local query_ = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[i][2][j] .. " WHERE itemtype = " .. item .. " AND SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[i][1] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
                                                                                                                                local delete = db.executeQuery("delete from " .. tablesToCheck[i][1] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
                                                                                                                                count = (delete and count + 1 or count)
                                                                                                                                local delete2 = db.executeQuery("delete from " .. tablesToCheck[i][2][j] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
                                                                                                                                count = (delete2 and count + 1 or count)
                                                                                                                                text = "[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][1] .. "' [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!") ..
                                                                                                                                "\n[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][2][j] .. "' [Player: " .. getPlayerNameByGUID(query_:getDataInt("player_id")) .. ", Item: " .. query_:getDataInt("itemtype") .. ", Count: " .. query_:getDataInt("count") .. ", Serial: " .. query_:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
                                                                                                                                final = final .. (final ~= "" and "\n" or "") .. text
                                                                                                                                print(text)
                                                                                                                                if not query:next() then break end
                                                                                                                end
                                                                                                end
                                                                                end
                                                                end
                                                end
                                end
                end
                if f ~= nil then
                                f:write("[" .. os.date("%d %B %Y %X ", os.time()) .. "] >> [Anti-Dupe] " .. count .. " duplicated items have been deleted from the database.\n" .. (final == "" and "[!] -> No duplicated item was found in the database" or final) .. "\n\n")
                                f:close()
                else
                                print("[!] -> [Anti-Dupe] Cannot save info to file!")
                end
                return true
end