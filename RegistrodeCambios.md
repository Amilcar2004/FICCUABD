# Registro de Cambios Acordados en las Reuniones 

## Migración a evento único global (2026-02)

- **Schema:** `events` renombrado a `event`
- **Eliminada:** `event.tblEvents` (evento único, sin tabla de eventos)
- **Columnas eliminadas:** `idEvent` en tblDelegationType, tblEventConfigurations, tblUniversityStaffs
- **Tabla renombrada:** `users.tblUserEvents` → `event.tblEventUser` (singular, sin idEvent)
- **Deporte:** Schema sports movido a script/base separada para eventos deportivos
- **Arte reestructurado:**
  - `event.tblModalities` (idDelegationType) reemplaza arts.tblArtModalities
  - `event.tblCategories` (idModality) reemplaza arts.tblArtCategories
  - Eliminadas: arts.tblArts, arts.tblArtTypes, arts.tblArtCategoriesModalities
  - arts.tblArtDelegations usa idModality e idCategory (FK a event)

## Definicionde Niveles de Acceso Físico en el evento
![imagen](https://drive.google.com/file/d/15G6Wxb_BCWlmAy8UrUdBrGJ9Q79R55N4/view?usp=drive_link)





