-- Agenda Uninorte: actualiza 2026 con el archivo «Calendario 2026 V1» (25 nov 2026).
-- Pégalo completo en Supabase → SQL Editor → Run. Se puede correr más de una vez sin duplicar nada.
-- El Simulacro del 27 oct no va porque ya estaba como «Simulacro mayor de emergencia 2026».
-- Solo agrega tareas nuevas y marca como realizadas dos que el Excel ya pinta en verde. No borra ni cambia nada más.

insert into public.tareas (id, fecha, nombre, inicio, fin, modalidad, ubicacion, estado) values
  ('xl26v1-001', '2026-04-06', 'Excel Avanzado y Análisis de Datos', '10:00', '12:00', 'Presencial', 'Sala de usuarios No.4-Bloque D Piso 3', 'Realizado'),
  ('xl26v1-002', '2026-04-23', 'Escuela de Liderazgo', '08:30', '12:30', 'Presencial', 'BIBLAB - BIBLIOTECA PISO 1', 'Realizado'),
  ('xl26v1-003', '2026-05-07', 'Comunicación efectiva y escucha activa', '', '', '', '', 'Pendiente'),
  ('xl26v1-004', '2026-05-07', 'Conservación auditiva', '', '', '', '', 'Pendiente'),
  ('xl26v1-005', '2026-05-07', 'Gestión Administrativa G2 - Brigada de Emergencia', '08:00', '17:00', 'Presencial', 'Salon 22E', 'Realizado'),
  ('xl26v1-006', '2026-05-14', 'Jurados', '08:00', '18:00', 'Presencial', 'Salon 22E', 'Realizado'),
  ('xl26v1-007', '2026-05-14', 'Capacitación en sueño saludable: Hábitos del sueño y ritmo circadiano en turnos laborales', '12:30', '14:00', 'Presencial', 'Bloque K - Salón 96k', 'Realizado'),
  ('xl26v1-008', '2026-05-14', 'Plan de Emergencia Institucional - Coordinadores y líderes de evacuación Grupo B', '16:30', '18:30', 'Presencial', 'Salon 22E', 'Pendiente'),
  ('xl26v1-009', '2026-05-15', 'Actividades Grupo Centro Médico', '08:00', '10:00', 'Presencial', 'Centro Médico', 'Realizado'),
  ('xl26v1-010', '2026-05-15', 'Jurados', '08:00', '18:00', 'Presencial', 'Salon 22E', 'Realizado'),
  ('xl26v1-011', '2026-05-15', 'Plan de Emergencia Institucional - Manejo de crisis', '10:00', '12:00', 'Presencial', 'Salón Meira del Mar', 'Realizado'),
  ('xl26v1-012', '2026-05-15', 'Escuela de Liderazgo (Planeación Estratégica)', '14:00', '18:00', 'Presencial', 'L42J - Lab Idiomas No.6 - Bloque J', 'Realizado'),
  ('xl26v1-013', '2026-05-21', 'Conservación auditiva', '', '', '', '', 'Pendiente'),
  ('xl26v1-014', '2026-05-21', 'Resiliencia, flexibilidad y agilidad', '', '', '', '', 'Pendiente'),
  ('xl26v1-015', '2026-05-22', 'Manejo de residuos químicos y disposición final - grupo 2', '14:00', '16:00', 'Presencial', 'Salón 22E', 'Pendiente'),
  ('xl26v1-016', '2026-05-28', 'Actuamos con Integridad y Responsabilidad', '', '', '', '', 'Pendiente'),
  ('xl26v1-017', '2026-05-28', 'Taller: cómo actuar ante emergencias', '08:30', '10:00', 'Presencial', 'Salón 22E', 'Realizado'),
  ('xl26v1-018', '2026-05-28', 'Taller para la conservación auditiva', '14:00', '15:30', 'Presencial', 'Salón 22E', 'Realizado'),
  ('xl26v1-019', '2026-05-29', 'Brigada grupo 2 Atención Prehospitalaria', '08:00', '17:00', 'Presencial', '22E', 'Pendiente'),
  ('xl26v1-020', '2026-09-28', 'Manejo de crisis y desorden público', '14:00', '16:00', 'Virtual', '', 'Programado'),
  ('xl26v1-022', '2026-11-03', 'Revisar plan', '', '', '', '', 'Programado'),
  ('xl26v1-023', '2026-11-13', 'Presentación Efectiva y Expresión Oral', '14:00', '16:00', 'Virtual', '', 'Programado'),
  ('xl26v1-024', '2026-11-18', 'De la Observación a la Acción: Identificar para Prevenir.', '14:00', '15:30', 'Presencial', '22E', 'Programado'),
  ('xl26v1-025', '2026-11-18', 'Clausura Escuela de Liderazgo Transformador', '16:30', '17:30', 'Presencial', 'Bocas de Ceniza', 'Programado'),
  ('xl26v1-026', '2026-11-20', 'Despedida Mari', '', '', '', '', 'Programado'),
  ('xl26v1-027', '2026-11-24', 'Entrenamiento básico en el uso de C-CURE 9000.', '08:00', '16:00', 'Presencial', 'Salón 1 CEC, Sótano bloque G', 'Programado'),
  ('xl26v1-028', '2026-12-04', 'Encuentro de brigadistas Uninorte 2026', '08:00', '15:00', 'Presencial', 'Jardín Casa Blanca', 'Programado')
on conflict (id) do nothing;

-- El Excel ya marca estas dos sesiones como realizadas (solo cambia si siguen en Programado)
update public.tareas set estado = 'Realizado' where id in ('xl26-302', 'xl26-310') and estado = 'Programado';
