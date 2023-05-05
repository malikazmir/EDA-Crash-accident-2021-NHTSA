--1. kondisi yang memperbesar kecelakaan
--a.
select functional_system_name, count (number_of_vehicle_forms_submitted_all) as kondisi_tipe_jalanan,
  sum (number_of_fatalities) as jumlah_kematian
from
(select distinct
*
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
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')) as crash_cleansing
group by functional_system_name
order by kondisi_tipe_jalanan desc

--b.
select type_of_intersection_name, count (number_of_vehicle_forms_submitted_all) as jenis_persimpangan,
 sum (number_of_fatalities) as jumlah_kematian
from
(select distinct
*
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
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')) as crash_cleansing
group by type_of_intersection_name
order by jenis_persimpangan desc

--c.
select light_condition_name, count (number_of_vehicle_forms_submitted_all) as kondisi_pencahayaan,
sum (number_of_fatalities) as jumlah_kematian
from
(select distinct
*
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
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')) as crash_cleansing
group by light_condition_name
order by kondisi_pencahayaan desc

--d.
select atmospheric_conditions_1_name, count (number_of_vehicle_forms_submitted_all) as kondisi_atmosfir,
 sum (number_of_fatalities) as jumlah_kematian
from
(select distinct
*
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
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')) as crash_cleansing
group by atmospheric_conditions_1_name
order by kondisi_atmosfir desc