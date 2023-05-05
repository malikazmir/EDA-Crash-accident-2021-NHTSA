select distinct
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
(to_char (crash_time, 'dd/mm/yyyy')) like ('%2021')
order by 1
