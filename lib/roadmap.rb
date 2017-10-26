module Roadmap
  def get_roadmap(roadmap_id)
    response = self.class.get("#{@base_uri}/roadmaps/#{roadmap_id}", headers: { "authorization" => user_token })
    JSON.parse response.body
  end

  def checkpoints
    final = []
    arr = get_roadmap(31)["sections"].map do |s|
      s["checkpoints"].map do |c|
        c["id"] if c["id"]
      end
    end
    arr.each {|a| final.concat(a) unless a.empty? }
    return final
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{@base_uri}/checkpoints/#{checkpoint_id}", headers: { "authorization" => user_token })
    JSON.parse response.body
  end
end

# checkpoints
# [1606, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621, 1622, 1623, 1624, 1889, 1607, 1608, 1609, 1610, 1611, 1625, 1626, 1627, 1628, 1629, 1630, 1890, 1631, 1632, 1733, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1891, 1645, 1647, 1641, 1642, 1734, 1643, 1644, 1646, 1648, 1654, 1656, 1659, 1657, 1658, 1660, 1661, 1664, 1675, 1676, 1677, 1678, 1679, 1680, 1681, 1682, 1683, 1684, 1685, 1665, 1666, 1667, 1668, 1669, 1670, 1671, 1672, 1673, 1674, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1893, 1895, 1897, 1899, 1901, 1903, 1905, 1907, 1711, 1712, 1713, 1714, 1715, 1716, 1717, 1718, 1719, 1720, 1721, 1722, 1723, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938]
