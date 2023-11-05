use context essentials2021
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

include gdrive-sheets
       include data-source
       ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
       kWh-wealthy-consumer-data =
             load-table: komponent, energi
             source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
       
sanitize komponent using string-sanitizer
    sanitize energi using string-sanitizer
  end
print(kWh-wealthy-consumer-data)

    fun energi-to-number(str :: String) -> Number:
    doc: "If str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
       where:
         energi-to-number("") is 0         
    energi-to-number("48") is 48
       end

transform-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

#funksjon for å beregme energiforbruket for bilbruk
fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(6, 3, 2) is 4
end

distance-travelled-per-day = 6
distance-per-unit-of-fuel = 3
energy-per-unit-of-fuel = 2


#Beregne det totale energiforbruket for en typisk innbygger i et industriland. bruker funksjonen sum sammen med funskjonen car-energi-per-day.
total-energi-car = sum(transform-table, "energi") + car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel)

total-energi-car

#visualisering av data fra tabellen
bar-chart(transform-table, "komponent", "energi")

# Ny funksjon for å få vist korret energiforbruk for bil i visualiseringen
fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(6 , 3, 2)
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Ny tabell med energiforbruk for bil
transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

print(transformed-table-with-car)

#Ny visualisering med energiforbuket for bil
bar-chart(transformed-table-with-car, "komponent", "energi")
