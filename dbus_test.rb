require 'dbus'

# bus = DBus::SessionBus.instance
bus = DBus::SystemBus.instance
nm_service = bus.service 'org.freedesktop.NetworkManager'

nm_obj = nm_service.object '/org/freedesktop/NetworkManager'
nm_iface = nm_obj['org.freedesktop.NetworkManager']

# p nm_iface['AllDevices']

devices = []
start = Time.now

nm_iface['AllDevices'].each do |dev_path|
  dev_obj = nm_service[dev_path]
  dev_iface = dev_obj['org.freedesktop.NetworkManager.Device']

  dev_iface.on_signal 'StateChanged' do |*params|
    puts "StateChanged for dev #{dev_iface['Interface']}"
    puts params
  end

  dev = {
    'Udi'.downcase.to_sym => dev_iface['Udi'],
    'Interface'.downcase.to_sym => dev_iface['Interface'],
    'IpInterface'.downcase.to_sym => dev_iface['IpInterface'],
    'Driver'.downcase.to_sym => dev_iface['Driver'],
    'DriverVersion'.downcase.to_sym => dev_iface['DriverVersion'],
    'FirmwareVersion'.downcase.to_sym => dev_iface['FirmwareVersion'],
    'Capabilities'.downcase.to_sym => dev_iface['Capabilities'],
    'Ip4Address'.downcase.to_sym => dev_iface['Ip4Address'],
    'State'.downcase.to_sym => dev_iface['State'],
    'StateReason'.downcase.to_sym => dev_iface['StateReason'],
    'ActiveConnection'.downcase.to_sym => dev_iface['ActiveConnection'],
    'Ip4Config'.downcase.to_sym => dev_iface['Ip4Config'],
    'Dhcp4Config'.downcase.to_sym => dev_iface['Dhcp4Config'],
    'Ip6Config'.downcase.to_sym => dev_iface['Ip6Config'],
    'Dhcp6Config'.downcase.to_sym => dev_iface['Dhcp6Config'],
    'Managed'.downcase.to_sym => dev_iface['Managed'],
    'Autoconnect'.downcase.to_sym => dev_iface['Autoconnect'],
    'FirmwareMissing'.downcase.to_sym => dev_iface['FirmwareMissing'],
    'NmPluginMissing'.downcase.to_sym => dev_iface['NmPluginMissing'],
    'DeviceType'.downcase.to_sym => dev_iface['DeviceType'],
    'AvailableConnections'.downcase.to_sym => dev_iface['AvailableConnections'],
    'PhysicalPortId'.downcase.to_sym => dev_iface['PhysicalPortId'],
    'Mtu'.downcase.to_sym => dev_iface['Mtu'],
    'Metered'.downcase.to_sym => dev_iface['Metered'],
    'LldpNeighbors'.downcase.to_sym => dev_iface['LldpNeighbors'],
    'Real'.downcase.to_sym => dev_iface['Real']
  }
  devices << dev
  p dev_path
  p dev
end

# puts Time.now - start
#
# p devices

# ipaddr = '192.168.1.195'
#
# settings_obj = nm_service.object '/org/freedesktop/NetworkManager/Settings'
# settings_iface = settings_obj['org.freedesktop.NetworkManager.Settings']
#
# settings_iface['Connections'].each do |path|
#   p path
#   conn_obj = nm_service.object path
#   conn_iface = conn_obj['org.freedesktop.NetworkManager.Settings.Connection']
#
#   settings = conn_iface.GetSettings.first
#   p settings
#
#   iface = settings['connection']['interface-name']
#   if iface && iface.eql?('enx0001c027cd12')
#     new_data = settings.dup
#
#     # new_data['ipv4']['address-data'].first['address'] = '192.168.1.190'
#     # new_data['ipv4']['address-data'] = DBus.variant "aa{sv}", new_data['ipv4']['address-data']
#
#     new_data['ipv4'] = { 'method' => 'auto', 'addresses' => DBus.variant('aau', [[IPAddr.new(ipaddr).hton.unpack('V').first, 24, 0]]) }
#     new_data['connection'].delete 'permissions'
#     new_data['connection'].delete 'timestamp'
#     new_data.delete '802-3-ethernet'
#     new_data.delete 'ipv6'
#     new_data.delete 'proxy'
#
#     puts "\n\nNEW: #{new_data}"
#
#     conn_iface.Update new_data
#
#     break
#   end
# end


loop = DBus::Main.new
loop << bus
loop.run
