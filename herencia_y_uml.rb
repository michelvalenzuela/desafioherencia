class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end


end


class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        @day = day
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        day()
    end

    

    def occurs_on?(day)
        day == @day
    end

    def to_s()
        "Reunion única en #{@location} sobre #{@purpose}, a las #{@hour}:#{@min} el dia #{@day}"
    end

end

class DailyAppointment < Appointment
    def occurs_on?(hour,min)
        hour == @hour && min == @min 
    end

    def to_s()
        "Reunion única en #{@location} sobre #{@purpose}, a las #{@hour}:#{@min}"
    end

end

class OneTimeAppointment < Appointment
    attr_reader :day , :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        @day = day 
        @month = month
        @year = year
        @location = location
        @purpose = purpose
        @hour =hour
        @min = min
        

    end

    def occurs_on?(day,month,year)
        day == @day && month == @month && year == @year
    end

    def to_s()
        "Reunion única en #{@location} sobre #{@purpose}, a las #{@hour}:#{@min} en la fecha #{@day}/#{@month}/#{@year}"
    end

end



puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
fecha = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
if fecha.occurs_on?(5, 7, 2020) 
    puts "Si ocurre a esa fecha" 
else 
    puts "Evento no ocurre en esa fecha"
end

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
dia = DailyAppointment.new('Desafío Latam', 'Educación', 9, 15)
if dia.occurs_on?(9, 15) 
    puts "Si ocurre a esa hora" 
else 
    puts "Evento no ocurre 9:15"
end


puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
mes = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
if mes.occurs_on?(23) 
    puts "Si ocurre ese dia" 
else 
    puts "Evento no ese dia"
end