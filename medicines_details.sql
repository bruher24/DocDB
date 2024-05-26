#Подробно о препаратах для пациента
SET @patient_id = '4';

SELECT Medicines.medicine_name, Medicines.medicine_desc, patients_medicines.medicine_dose, patients_medicines.medicine_start, patients_medicines.medicine_end, patients_medicines.medicine_result
FROM patients_medicines INNER JOIN Medicines ON (patients_medicines.medicine_id = Medicines.medicine_id)
WHERE patients_medicines.patient_id = @patient_id;
