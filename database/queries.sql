
-- 1. View all machine readings
SELECT *
FROM machine_telemetry
ORDER BY time DESC;

-- 2. Average sensor values by machine
SELECT
    machine_id,
    machine_type,
    AVG(temperature) AS avg_temperature,
    AVG(vibration) AS avg_vibration,
    AVG(pressure) AS avg_pressure,
    AVG(rpm) AS avg_rpm
FROM machine_telemetry
GROUP BY machine_id, machine_type;

-- 3. Find abnormal readings (demo thresholds)
SELECT
    time,
    machine_id,
    machine_type,
    temperature,
    vibration
FROM machine_telemetry
WHERE temperature >= 75
   OR vibration >= 5;

-- 4. Highest temperature recorded per machine
SELECT
    machine_id,
    machine_type,
    MAX(temperature) AS max_temperature
FROM machine_telemetry
GROUP BY machine_id, machine_type;

-- 5. Count readings for each machine
SELECT
    machine_id,
    machine_type,
    COUNT(*) AS total_readings
FROM machine_telemetry
GROUP BY machine_id, machine_type;
