select
*
from
(select
to_char(crash_time, 'mm/yyyy'),
sum (number_of_vehicle_forms_submitted_all) jumlah_kendaraan_terlibat,
sum(number_of_parked_working_vehicles) parkir,
sum(number_of_fatalities) kematian,
sum(number_of_persons_not_in_motor_vehicles_in_transport_mvit) pejalan_kaki,
sum (number_of_drunk_drivers) mabuk,
sum (number_of_forms_submitted_for_persons_not_in_motor_vehicles) orang_kumpul,
--case when number_of_drunk_drivers>0 then 'mabuk' else 'tidak mabuk' end as case_accident,

count (1) as jumlah_kasus_kecelakaan
from

	(select distinct
	*,
	case
	when State_name in ('Alaska') then timestamp_of_crash at time zone 'AKST'
	when State_name in ('Oklahoma','Mississippi','Louisiana','Arkansas','Missouri','South Dakota','Iowa','Minnesota','Kentucky','Wisconsin','Illinois','North Dakota','Nebraska','Tennessee','Kansas','Texas','Alabama') then timestamp_of_crash at time zone 'CST'
	when State_name in ('North Carolina','Florida','Vermont','Delaware','New York','West Virginia','South Carolina','New Jersey','Connecticut','District of Columbia','Indiana','Massachusetts','Rhode Island','Ohio','Michigan','Pennsylvania','Virginia','Maryland','Georgia','New Hampshire','Maine') then timestamp_of_crash at time zone 'EST'
	when State_name in ('Hawaii') then timestamp_of_crash at time zone 'HST'
	when State_name in ('Colorado','New Mexico','Montana','Arizona','Utah','Wyoming','Idaho') then timestamp_of_crash at time zone 'MST'
	when State_name in ('Nevada','Washington','California','Oregon') then timestamp_of_crash at time zone 'PST'

	end as Crash_time
	from crash) a


where
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')
group by 1
order by 1) as b
order by 1