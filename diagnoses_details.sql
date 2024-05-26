#Подробно о диагнозах пациента
SET @patient_id = '4';

SELECT Diagnoses.diagnosis_name, Diagnoses.diagnosis_desc, patients_diagnoses.diagnosis_date, patients_diagnoses.actuality
FROM patients_diagnoses INNER JOIN Diagnoses ON (patients_diagnoses.diagnosis_id = Diagnoses.diagnosis_id)
WHERE patients_diagnoses.patient_id = @patient_id;
