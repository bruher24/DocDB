#Подробно о терапии пациента
SET @patient_id = '4';

SELECT Therapies.therapy_name, Therapies.therapy_desc, patients_therapies.therapy_start, patients_therapies.therapy_end, patients_therapies.therapy_result
FROM patients_therapies INNER JOIN Therapies ON (patients_therapies.therapy_id = Therapies.therapy_id)
WHERE patients_therapies.patient_id = @patient_id;