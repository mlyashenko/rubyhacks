require 'socket'

module DetectIPv4
  extend self
  
  def get_public_ipv4
    Socket.ip_address_list.detect do |addr| 
      addr.ipv4? && !addr.ipv4_loopback? && !addr.ipv4_multicast? && !addr.ipv4_private?
    end&.ip_address
  end
  
  def get_private_ipv4
    Socket.ip_address_list.detect do |addr|
      addr.ipv4_private?
    end&.ip_address
  end
end
