# Agenda Uninorte 2026–2028

Agenda de Gestión Humana · Capacitación y Desarrollo de la Universidad del Norte. Es una sola página (`index.html`) publicada con GitHub Pages, con selector de año (2026, 2027 y 2028); las tareas se guardan en una tabla de Supabase y se sincronizan en vivo entre todos los que tengan la página abierta.

## Configurar Supabase (una sola vez)

1. Entra a [supabase.com](https://supabase.com), inicia sesión (puedes usar tu cuenta de GitHub) y crea un proyecto nuevo con *New project*. Nómbralo, por ejemplo, `agenda-uninorte`, inventa una contraseña de base de datos (guárdala, aunque la app no la usa) y escoge la región más cercana (East US o São Paulo). El plan gratis alcanza de sobra.
2. Cuando el proyecto termine de crearse, abre **SQL Editor**, pega todo el contenido de [`supabase.sql`](supabase.sql) y dale **Run**. Eso crea la tabla `tareas`, los permisos y la sincronización en vivo.
3. Ve a **Project Settings → API** (en algunas versiones aparece como *API Keys*) y copia dos datos:
   - **Project URL**, algo como `https://abcdefgh.supabase.co`.
   - La llave pública: **anon public** o **publishable key** (empieza por `eyJ…` o por `sb_publishable_…`). Nunca uses la `service_role` ni la `secret`.
4. Pega esos dos datos en [`config.js`](config.js) y guarda el cambio (desde GitHub: abre el archivo, lápiz de editar, *Commit changes*). En uno o dos minutos la página queda conectada y abajo del título aparece **● En vivo**.

## Qué implica no tener login

La llave pública queda visible en `config.js` y en el navegador de cualquiera que abra la página. Por eso, cualquier persona que tenga el link (o que encuentre el repo, que es público) puede ver, crear, editar y borrar tareas. La tabla limita lo que se puede guardar (fechas de 2026 a 2028, estados y modalidades válidos, textos cortos), pero no distingue quién hizo cada cambio. Si algún día se necesita control, el siguiente paso es activar el login de Supabase con correo `@uninorte.edu.co` y cambiar las políticas de la tabla.

Supabase pausa los proyectos gratis tras unos días sin uso; si pasa, se reactiva con un clic desde su panel.

## Si la base no está configurada

La página sigue funcionando, pero guarda solo en el navegador de cada persona y lo indica con **● Solo en este navegador**.

## Ampliación a 2026–2028

Si la tabla se creó cuando la agenda era solo de 2027, corre una vez [`migracion-2026-2028.sql`](migracion-2026-2028.sql) en el SQL Editor. Amplía las fechas permitidas a 2026–2028 y carga las tareas de 2026 del archivo *Calendario 2026 V1.1*. Se puede correr más de una vez sin duplicar tareas.

## Añadir a cursos abiertos

Al editar una tarea aparece el botón **Añadir a cursos abiertos ↗**. Abre en otra pestaña la app de [Cursos abiertos](https://programacion-cursos-abiertos.capacitacion-acb.workers.dev) (vista de administrador) con una tarea nueva para el diseñador, ya llena con el nombre, la fecha, las horas, el link de la sesión y, en *Observaciones*, la modalidad, la ubicación y las observaciones de la agenda. Allí solo falta elegir la fecha del boletín y darle **Programar tarea**. Toma lo que esté escrito en el formulario en ese momento, aunque no se haya guardado. Si la dirección de esa app cambia, actualiza `cursosUrl` en [`config.js`](config.js).
