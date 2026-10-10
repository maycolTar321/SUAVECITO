# SISTEMA DE GESTIÓN DE PERSONAL — SMTDE
## Secretaría Municipal de Turismo y Desarrollo Económico

Este repositorio contiene la aplicación base inicializada con **Next.js**, **React**, **Tailwind CSS** y **TypeScript**. Se ha estructurado el modelo de base de datos en **Supabase**.

### 🚀 1. Configuración de Base de Datos (Supabase)

1. Crea un proyecto en [Supabase](https://supabase.com).
2. Ve al panel de "SQL Editor" de tu proyecto en Supabase.
3. Copia el contenido del archivo `supabase_schema.sql` (ubicado en `D:\ALCALDIA\supabase_schema.sql`) y ejecútalo. Esto creará todas las tablas, relaciones y políticas de seguridad (RLS).

### 🔑 2. Variables de Entorno

1. En la carpeta raíz del proyecto (`D:\ALCALDIA\smtde-rrhh`), renombra el archivo `.env.example` a `.env.local`.
2. Completa los valores de `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY` con las credenciales de tu proyecto Supabase (las encuentras en Project Settings > API).

### 👥 3. Crear el primer Administrador

Como la aplicación está protegida con Supabase Auth y RLS, no hay cuentas por defecto.
1. En el panel de Supabase, ve a **Authentication** > **Users** y añade un nuevo usuario con tu correo institucional y contraseña.
2. Ve al **Table Editor**, selecciona la tabla `profiles`.
3. Busca tu registro recién creado y cambia la columna `rol` a `Administrador` (y asegúrate de que `activo` sea `true`).

### 📦 4. Despliegue en Vercel y GitHub

1. Inicializa el repositorio Git y súbelo a GitHub:
   ```bash
   git init
   git add .
   git commit -m "Inicialización del sistema SMTDE"
   git branch -M main
   git remote add origin https://github.com/tu-usuario/smtde-rrhh.git
   git push -u origin main
   ```
2. Inicia sesión en [Vercel](https://vercel.com) y añade un "New Project".
3. Importa el repositorio `smtde-rrhh`.
4. En "Environment Variables", añade `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY`.
5. Haz clic en **Deploy**. ¡Tu sistema estará en línea!

### 💻 5. Desarrollo de los Módulos

El proyecto frontend base y las conexiones a base de datos están listas. Para levantar el proyecto localmente y continuar desarrollando los módulos, ejecuta:

```bash
npm run dev
```

Las dependencias clave ya instaladas son:
- `@supabase/supabase-js`
- `recharts` (para el dashboard)
- `lucide-react` (para iconos institucionales)
- `date-fns` (para el cálculo de edades y antigüedades)
