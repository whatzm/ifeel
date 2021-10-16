class NetDev
    attr_accessor :address

    def initialize(address)
        puts "My address is #{address}"
      #  @address = address 
    end

    def ping
        puts "pinging #{@address}"
        
    end
end