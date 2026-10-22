-- Agenda Uninorte 2027: pega todo esto en Supabase → SQL Editor → Run.

create table if not exists public.tareas (
  id          text primary key,
  fecha       date not null check (fecha between '2027-01-01' and '2027-12-31'),
  nombre      text not null check (char_length(nombre) between 1 and 120),
  inicio      text not null default '',
  fin         text not null default '',
  modalidad   text not null default '' check (modalidad in ('', 'Presencial', 'Virtual', 'Híbrido')),
  ubicacion   text not null default '' check (char_length(ubicacion) <= 80),
  link        text not null default '' check (char_length(link) <= 500),
  estado      text not null default 'Pendiente' check (estado in ('Pendiente', 'Programado', 'Realizado', 'Cancelado')),
  actualizado timestamptz not null default now()
);

create index if not exists tareas_fecha_idx on public.tareas (fecha);

-- Marca la hora de cada cambio
create or replace function public.tareas_tocar() returns trigger language plpgsql as $$
begin new.actualizado := now(); return new; end $$;
drop trigger if exists tareas_tocar on public.tareas;
create trigger tareas_tocar before insert or update on public.tareas
  for each row execute function public.tareas_tocar();

-- Sin login: cualquiera con el link puede ver, crear, editar y borrar
alter table public.tareas enable row level security;
drop policy if exists "Todos pueden ver"    on public.tareas;
drop policy if exists "Todos pueden crear"  on public.tareas;
drop policy if exists "Todos pueden editar" on public.tareas;
drop policy if exists "Todos pueden borrar" on public.tareas;
create policy "Todos pueden ver"    on public.tareas for select to anon, authenticated using (true);
create policy "Todos pueden crear"  on public.tareas for insert to anon, authenticated with check (true);
create policy "Todos pueden editar" on public.tareas for update to anon, authenticated using (true) with check (true);
create policy "Todos pueden borrar" on public.tareas for delete to anon, authenticated using (true);

-- Avisos en vivo a los navegadores abiertos
do $$ begin
  alter publication supabase_realtime add table public.tareas;
exception when duplicate_object then null; end $$;
