-- Convert a CIDR subnet mask to dotted decimal notation.
--
-- @param subnet CIDR string representing the subnet mask.
-- @usage
-- local netmask = ipOps.cidr_to_subnet( "/16" )
-- @return Dotted decimal representation of the suppliet subnet mask (e.g. "255.255.0.0")
cidr_to_subnet = function( subnet )
  local bits = subnet:match("/(%d%d)$")
  if not bits then return nil end
  return fromdword((0xFFFFFFFF >> tonumber(bits)) ~ 0xFFFFFFFF)
end

---
-- Convert a dotted decimal subnet mask to CIDR notation.
--
-- @param subnet Dotted decimal string representing the subnet mask.
-- @usage
-- local cidr = ipOps.subnet_to_cidr( "255.255.0.0" )
-- @return CIDR representation of the supplied subnet mask (e.g. "/16").
subnet_to_cidr = function( subnet )
  local dword, err = todword(subnet)
  if not dword then return nil, err end
  return "/" .. tostring(32 - (math.tointeger(math.log((dword ~ 0xFFFFFFFF) + 1, 2))))
end

