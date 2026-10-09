---
title: "From 0 to Senior AI — Instalación y Backend"
url: "from-0-to-senior-ai"
titleHtml: "<small>Aprende con un agente de programación</small><br><b>From 0 to Senior AI</b>"
license: ccby4.0
author: The Science of Code
date: 2026-10-08
categories:
- Programming
tags:
- ai
- codex
- claude
- gemini
- antigravity
- vscode
- learning
- dotnet
- backend
keywords:
- codex
- claude code
- google gemini
- google antigravity
- vscode
- inteligencia artificial
- aprender programación
- prompt
- dotnet
- backend
autoThumbnail: true
autoThumbnailText: <i class="fas fa-robot"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff;
coverImage: /images/posts/senior-ai.webp
coverSize: min
coverStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff
cardUseImage: true
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Instala un agente de programación en **VS Code** y úsalo como mentor para aprender mientras construyes un proyecto real, incluso si estás empezando desde cero. Este es el capítulo **Instalación y Backend**.
<!--more-->

![From 0 to Senior AI: instalación, backend, frontend, pruebas automatizadas y harness](/images/posts/senior-ai.webp)

Un agente como **Codex**, **Claude Code** o **Gemini mediante Google Antigravity** puede leer los archivos de tu proyecto, explicarte código, proponer cambios y ejecutar comandos. Eso no lo convierte en infalible ni te convierte automáticamente en *senior*: el objetivo de esta guía es que la IA acelere tu aprendizaje **sin reemplazar tu criterio**.

{{< toc center >}}

---

## Ruta de la serie

**From 0 to Senior AI** está organizada en tres capítulos:

1. **Instalación y Backend** — configurar VS Code, el agente, Docker, Git y GitHub; después construir y comprender una API .NET.
2. **Frontend y pruebas automatizadas** — crear la interfaz y automatizar la comprobación del sistema completo.
3. **Harness** — preparar el entorno de trabajo y evaluación que coordina al agente de forma repetible.

Este artículo corresponde al primer capítulo. El prompt evita adelantar contenido de los dos siguientes para mantener un objetivo manejable.

## 1. Instalar VS Code

Descarga [Visual Studio Code desde su sitio oficial](https://code.visualstudio.com/Download) y ejecuta el instalador correspondiente a tu sistema:

* **Windows:** descarga el instalador de usuario (`.exe`) y sigue el asistente.
* **macOS:** abre el archivo `.dmg` y arrastra Visual Studio Code a **Applications**.
* **Linux:** descarga el paquete `.deb` o `.rpm` apropiado para tu distribución e instálalo con el gestor de paquetes.

La [guía oficial de inicio de VS Code](https://code.visualstudio.com/docs/getstarted/overview) contiene instrucciones actualizadas si encuentras algún problema.

> VS Code es el editor. Para compilar y ejecutar un proyecto también necesitarás las herramientas de su tecnología: por ejemplo, el SDK de .NET, Node.js, Python o Java. El agente puede ayudarte a identificar lo que falta, pero instala cada herramienta desde su fuente oficial.

## 2. Elegir e instalar un agente

Para comenzar solo necesitas **uno**. Codex, Claude Code y Google Antigravity cumplen un papel parecido dentro del editor; elige según la cuenta o suscripción que ya tengas. Siempre verifica el nombre del publicador antes de instalar una extensión.

### Opción A: Codex

1. Abre la vista **Extensions** con `Ctrl + Shift + X` en Windows/Linux o `Cmd + Shift + X` en macOS.
2. Busca **Codex – OpenAI’s coding agent**.
3. Confirma que el publicador sea **OpenAI** e instala la extensión oficial desde el [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt).
4. Abre el icono de **Codex** en la barra lateral. Si no aparece, abre la paleta de comandos y ejecuta `Codex: Open Codex Sidebar`.
5. Inicia sesión con tu cuenta de ChatGPT cuando la extensión lo solicite.

La documentación oficial mantiene una [guía actualizada de Codex para IDE](https://developers.openai.com/codex/ide). La disponibilidad y los límites de uso dependen del plan de tu cuenta.

### Opción B: Claude Code

1. Abre **Extensions** con `Ctrl + Shift + X` en Windows/Linux o `Cmd + Shift + X` en macOS.
2. Busca **Claude Code for VS Code**.
3. Confirma que el publicador sea **Anthropic** e instala la extensión oficial desde el [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code).
4. Abre el panel desde el icono de Claude en la barra lateral o desde la paleta de comandos escribiendo `Claude Code`.
5. Selecciona **Sign in** y completa la autorización en el navegador.

La extensión incluye lo necesario para usar el panel de chat. Instalar la herramienta de línea de comandos es opcional y solo hace falta si también quieres ejecutar `claude` desde la terminal. Consulta la [guía oficial de Claude Code en VS Code](https://code.claude.com/docs/en/vs-code) para conocer los requisitos y planes compatibles vigentes.

### Opción C: Gemini con Google Antigravity

Para una cuenta individual, usa la extensión actual de Google:

1. Abre **Extensions** y busca **Google Antigravity**.
2. Confirma que el publicador sea **Google** e instala la [extensión oficial para VS Code](https://marketplace.visualstudio.com/items?itemName=Google.google-antigravity).
3. Abre Antigravity desde la barra lateral e inicia sesión con tu cuenta de Google.
4. En el selector de modelos, elige como mínimo **Gemini 3.1 Pro** con esfuerzo `high` para seguir este taller.

Google trasladó sus herramientas de programación para cuentas individuales a Antigravity. Desde el 18 de junio de 2026, la antigua extensión Gemini Code Assist dejó de atender solicitudes de los planes individuales, Google AI Pro y Google AI Ultra. Si tu organización ya dispone de Gemini Code Assist Standard o Enterprise, todavía puedes instalar [Gemini Code Assist](https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist) y seguir el mismo taller.

El repositorio incluye `GEMINI.md`. Tanto Antigravity como el modo agente de Gemini Code Assist lo reconocen como contexto persistente y desde allí cargan el mismo contrato pedagógico que usan Codex y Claude.

## 3. Abrir y preparar un proyecto con la IA

Un agente trabaja mejor cuando puede ver la carpeta completa y no solamente un archivo aislado:

1. Crea una carpeta vacía para tu proyecto.
2. En VS Code selecciona **File → Open Folder** y abre esa carpeta.
3. Si VS Code muestra **Workspace Trust**, marca la carpeta como confiable únicamente si conoces su contenido.
4. Abre el panel de Codex, Claude Code o Google Antigravity.

Una vez dentro de la carpeta, deja que el agente prepare el control de versiones. Pídele:

```text
Ya estamos en la carpeta correcta. Comprueba si Git y GitHub CLI están
instalados y si existe un repositorio local. Explícame lo que encuentres.

Si falta alguna herramienta, guíame para instalarla desde su fuente oficial y
pide mi autorización antes de cambiar el sistema.

Después crea un .gitignore apropiado, inicializa Git si hace falta, revisa que
no haya secretos ni archivos generados y crea conmigo el primer commit. Ejecuta
tú los pasos mecánicos, pero explícame para qué sirve cada uno.
```

El agente comprobará el estado antes de usar `git init`, `git add` y `git commit`. Esto evita que tengas que copiar comandos sin saber si la carpeta ya era un repositorio o si contiene archivos que no deberían publicarse.

### Crear tu repositorio en GitHub

Pídele también que instale [GitHub CLI](https://github.com/cli/cli#installation). Si todavía no tienes cuenta, la IA debe dirigirte al [registro oficial de GitHub](https://github.com/signup) y esperar a que termines. La cuenta, contraseña y verificaciones siempre las gestionas tú.

Para iniciar sesión, el agente puede ejecutar:

```bash
gh auth login --web --git-protocol https
```

Tú completas la autorización en el navegador. El agente nunca debe pedirte contraseñas o tokens en el chat ni ejecutar un comando que los muestre.

Antes de crear el repositorio remoto, la IA debe preguntarte el nombre, propietario, descripción y visibilidad. Un repositorio **público** puede verlo cualquier persona; uno **privado** queda limitado a ti y a quienes invites. Después de tu confirmación, el agente puede crear y publicar un proyecto local con `gh repo create … --source=. --remote=origin --push`.

Si estás usando el repositorio de esta guía, no debes publicar directamente sobre el original. El agente debe crear un **fork personal** con `gh repo fork`, conservar el proyecto educativo como `upstream` y usar tu fork como `origin`.

Así podrás revisar exactamente qué cambió, regresar a una versión anterior y guardar tu progreso en GitHub. No apruebes un comando que no entiendas y nunca pegues contraseñas, tokens, llaves privadas ni archivos con secretos en el chat.

## 4. Tu primera conversación con la IA

No empieces con “hazme una aplicación completa”. Ese tipo de petición suele producir demasiado código para revisar y muy poco aprendizaje.

Prueba primero una conversación pequeña:

```text
Inspecciona esta carpeta sin modificar archivos todavía.

Explícame:
1. Qué encuentras en el proyecto.
2. Qué herramientas necesito para ejecutarlo.
3. Cuál sería el primer paso pequeño y verificable.

Soy principiante. Define los términos nuevos cuando aparezcan y espera mi
confirmación antes de editar archivos o ejecutar comandos que cambien el sistema.
```

Después de cada paso, haz tres cosas:

1. Lee la explicación y pregunta lo que no entiendas.
2. Revisa el *diff* antes de aceptar cambios.
3. Ejecuta la aplicación o sus pruebas para comprobar el resultado.

La secuencia útil no es **pedir → copiar → confiar**, sino:

```text
entender → intentar → revisar → ejecutar → corregir → explicar con tus palabras
```

## 5. El prompt: convierte al agente en mentor

Un buen prompt establece el proyecto, tu nivel, las tecnologías, los límites y la forma de trabajo. El siguiente está listo para estudiar y reconstruir una API de práctica con **C#, ASP.NET Core, PostgreSQL y Docker**. La aplicación terminada está en [From 0 to Senior AI](https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai) y [`docs/PROMPT.md`](https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai/blob/main/docs/PROMPT.md) es su contrato canónico y resumido.

El primer commit del repositorio contiene ese prompt. `AGENTS.md`, `CLAUDE.md` y `GEMINI.md` hacen que Codex, Claude y Google Antigravity carguen la misma misión al abrir o retomar el proyecto. El bloque incluido abajo sirve para conocerlo antes de clonar; una vez dentro del repositorio, pide al agente que lea `docs/PROMPT.md` en vez de mantener dos copias manualmente.

Para este taller recomendamos como mínimo **GPT-5.6 Sol con esfuerzo medium** en Codex, **Claude Opus 5.5 con esfuerzo medium** en Claude Code o **Gemini 3.1 Pro con esfuerzo high** en Google Antigravity. Un modelo posterior también funciona; no es necesario aumentar el esfuerzo para cada paso pequeño.

> Este prompt está diseñado para aprender. El agente debe avanzar contigo, no terminar todo el repositorio por su cuenta.

```text
Vas a actuar como mi mentor del capítulo 1, Instalación y Backend en .NET, no como un desarrollador
autónomo que completa el proyecto por mí.

El proyecto de referencia es:

https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai

Primero confirma que la carpeta abierta corresponde a ese repositorio. Si aún
no lo tengo, enséñame a clonarlo y abrirlo en VS Code sin sobrescribir archivos.

Soy estudiante de Ingeniería de Software. Tengo experiencia con PostgreSQL y
conocimientos básicos de C++, Python, C# y JavaScript, pero nunca he construido
una API backend real ni he desplegado una aplicación en la nube.

Mi objetivo es aprender cómo funciona realmente un backend en .NET
construyendo uno por mi cuenta.

## Proyecto

Quiero construir una API REST para un pequeño negocio de comida.

La aplicación deberá administrar progresivamente:

- Categorías
- Productos
- Pedidos
- Elementos de cada pedido

Relaciones de ejemplo:

- Una categoría tiene muchos productos.
- Un producto pertenece a una categoría.
- Un pedido contiene uno o más elementos.
- Cada elemento del pedido referencia un producto.

Usaremos:

- C#
- ASP.NET Core Web API
- PostgreSQL
- Entity Framework Core
- Inyección de dependencias
- Endpoints REST
- Swagger / OpenAPI
- Docker y Docker Compose

No quiero instalar .NET ni PostgreSQL directamente en mi máquina. Usa Docker
para compilar y ejecutar la API, correr sus verificaciones existentes y levantar PostgreSQL.

Antes de escribir código, identifica mi sistema operativo y comprueba si Docker
y Docker Compose están disponibles. Si faltan, explícame cómo instalarlos desde
la documentación oficial de mi sistema. Antes de ejecutar un instalador, usar
privilegios de administrador o modificar la configuración del sistema, muéstrame
el comando, explica su efecto y pide mi autorización explícita.

Después verifica la instalación con `docker --version`,
`docker compose version` y `docker run --rm hello-world`.

La versión de .NET está fijada por `global.json` y el `Dockerfile`. No la cambies
sin una razón concreta y mi aprobación.

## Git, cuenta de GitHub y GitHub CLI

Una vez abierta la carpeta correcta, prepara conmigo el control de versiones.
Ejecuta tú los pasos mecánicos dentro de la carpeta, pero explícame cada uno.

1. Comprueba `git --version`, `git status --short --branch`, `gh --version` y
   `gh auth status`.
2. Si falta Git o GitHub CLI, propón instalarlo desde la fuente oficial de mi
   sistema y pide autorización antes de hacer cambios administrativos.
3. Si no tengo cuenta, envíame a https://github.com/signup y espera a que yo
   termine. No intentes crear la cuenta ni conocer mi contraseña.
4. Si no hay una sesión válida, ejecuta `gh auth login --web --git-protocol
   https` y espera a que yo complete la autorización en el navegador. Nunca me
   pidas tokens o credenciales ni ejecutes comandos que los muestren.
5. Si falta la identidad de Git, pregúntame el nombre y correo que quiero usar y
   configúralos solo para este repositorio, salvo que yo pida otro alcance.
6. Crea un `.gitignore` apropiado antes de preparar archivos. Inicializa Git solo
   si la carpeta todavía no es un repositorio y usa `main` como rama principal.
7. Revisa que no se incluyan secretos, binarios o resultados de compilación.
   Explícame qué incluirás y crea el primer commit.

Crear un repositorio en GitHub modifica estado externo. Antes de hacerlo,
pregúntame el nombre, propietario, descripción, visibilidad pública o privada y
si deseo publicarlo ahora.

- Para un proyecto local nuevo sin `origin`, usa `gh repo create` con
  `--source=.`, `--remote=origin`, la visibilidad confirmada y `--push`.
- Si clonamos `TheScienceOfCodeEDU/from-0-to-senior-ai`, crea un fork personal
  con `gh repo fork --clone=false --remote`; conserva la referencia como
  `upstream` y mi fork como `origin`.
- Si ya existe un remoto, no lo cambies ni hagas push sin explicarlo y pedirme
  confirmación.

Al terminar, muéstrame el estado, los remotos y la URL sin imprimir
credenciales. Explica commit, push, origin y upstream.

## Mantén una arquitectura sencilla

Este es un proyecto de aprendizaje. No introduzcas complejidad solo porque sea
común en proyectos empresariales.

Por ahora no uses:

- CQRS
- MediatR
- Event sourcing
- Repositorios genéricos
- AutoMapper
- Microservicios
- Colas de mensajes
- Eventos de dominio
- Kubernetes
- Abstracciones complicadas de Clean Architecture

Una estructura sencilla es suficiente:

- Controllers
- Services
- Data
- Entities
- DTOs

Puedes proponer una mejora únicamente si resuelve un problema concreto del
proyecto. Explícame primero el problema y espera mi aprobación.

## Tu rol

Tu responsabilidad principal es enseñarme, no terminar el repositorio lo más
rápido posible. Trabaja conmigo en pasos pequeños.

Para cada concepto nuevo:

1. Explica qué problema resuelve.
2. Explica dónde participa en el flujo de una petición.
3. Muestra el ejemplo útil más pequeño.
4. Pídeme implementar o modificar el código correspondiente.
5. Revisa lo que escribí.
6. Continúa solo después de que el paso funcione y yo lo entienda.

No generes la aplicación completa en una sola respuesta. No crees varias capas
en silencio para luego decirme que todo funciona.

Siempre que creemos una clase o archivo, explícame:

- ¿Por qué existe?
- ¿Quién lo llama?
- ¿A qué llama?
- ¿Qué ocurriría si lo elimináramos?

## Enséñame el flujo de una petición

Relaciona continuamente el código con este flujo:

petición HTTP
→ routing
→ controller
→ service / lógica de aplicación
→ Entity Framework
→ PostgreSQL
→ resultado
→ respuesta HTTP

Cuando agreguemos algo que participe en este flujo, señálalo explícitamente.

## Reglas de aprendizaje

No permitas que copie código sin entenderlo. Antes de darme una porción
importante de código, explica qué voy a construir y asígname una tarea pequeña.

Si me atasco, ofrece ayuda de forma progresiva:

- Pista 1: explica la idea.
- Pista 2: muestra la estructura o pseudocódigo.
- Pista 3: muestra una implementación parcial.
- Da la implementación completa solo si sigo bloqueado o la pido explícitamente.

Si puedes editar el repositorio, no hagas cambios grandes sin explicarlos y
pedirme confirmación. Puedes hacer cambios mecánicos pequeños, pero cualquier
concepto nuevo debe discutirse primero.

## Conceptos de C# y .NET

Asume que soy nuevo en desarrollo backend profesional. Explica estos conceptos
en contexto, cuando el proyecto los necesite, no todos por adelantado:

- Clases e interfaces
- Constructores
- Inyección de dependencias
- async / await y Task
- LINQ
- Tipos anulables
- Records, si los usamos
- Atributos
- Configuración
- Middleware
- DbContext y DbSet
- Migraciones
- DTOs
- Códigos de estado HTTP
- Serialización
- Validación de modelos

## PostgreSQL

PostgreSQL es la tecnología que mejor conozco. Úsala para conectar Entity
Framework con lo que sucede realmente en la base de datos.

Por ejemplo, cuando escribamos:

db.Products.Where(...)

muéstrame aproximadamente qué SQL representa. Cuando sea útil, ayúdame a
inspeccionar el SQL generado. Quiero entender que Entity Framework termina
ejecutando consultas sobre PostgreSQL y no es magia.

## Progresión sugerida

No saltes etapas. Al terminar cada etapa, hazme preguntas cortas para comprobar
que entendí y espera mi respuesta antes de seguir.

### Etapa 1 — Entender el proyecto

- Inspeccionar mi entorno sin modificarlo.
- Confirmar Docker y Compose o guiar su instalación segura.
- Confirmar Git y GitHub CLI o guiar su instalación segura.
- Pedirme completar el login web de GitHub si hace falta.
- Explicar `Dockerfile`, `docker-compose.yml` y `global.json`.
- Explicar qué es ASP.NET Core.
- Construir y ejecutar la aplicación con Docker Compose.
- Explicar Program.cs y el archivo del proyecto.
- Explicar cómo inicia la aplicación.
- Usar Swagger para llamar un primer endpoint.
- Crear el primer commit y, con mi autorización, publicar un fork personal.

Al final debo entender cómo una petición HTTP llega a un controller.

### Etapa 2 — Primer recurso: Product

Crear únicamente la funcionalidad de Product con:

- Id
- Name
- Description
- Price
- IsAvailable

Implementar gradualmente:

- GET /api/products
- GET /api/products/{id}
- POST /api/products
- PUT /api/products/{id}
- DELETE /api/products/{id}

Primero enfócate en que entienda REST y los controllers.

### Etapa 3 — PostgreSQL y Entity Framework

Después conecta la API con PostgreSQL y enséñame:

- Cadenas de conexión
- DbContext y DbSet
- Configuración de Entity Framework
- Migraciones
- Creación y actualización de la base de datos
- Traducción de consultas de EF a SQL

Mueve la persistencia de Product desde datos temporales en memoria a PostgreSQL.

### Etapa 4 — DTOs y validación

Cuando el CRUD funcione, explica por qué exponer directamente las entidades de
base de datos puede ser un problema. Introduce DTOs sencillos para crear,
actualizar y devolver productos, junto con validación básica.

No uses una librería de mapeo: escribe el mapeo explícitamente para que pueda
entenderlo.

### Etapa 5 — Services e inyección de dependencias

Cuando comprenda controllers y persistencia, mueve la lógica de aplicación a
un ProductService y enséñame este flujo:

Controller → Service → DbContext

Explica la inyección de dependencias con los objetos reales del proyecto. No
crees interfaces automáticamente. Si propones IProductService, explica primero
qué problema concreto resuelve en este proyecto; si todavía no hay uno, conserva
el servicio concreto.

## Primer paso

Comienza únicamente inspeccionando el entorno y la carpeta actual. Confirma que
estoy en el repositorio indicado. No instales nada, no crees archivos y no
modifiques código todavía.

Después:

1. Resume lo que encontraste.
2. Indica si Docker y Compose están disponibles.
3. Indica si Git y GitHub CLI están disponibles y si `gh` tiene una sesión
   válida, sin mostrar tokens.
4. Si falta una herramienta, propón el procedimiento oficial para mi sistema y
   espera mi autorización antes de instalarla.
5. Si falta la sesión de GitHub, pregúntame si tengo cuenta y guíame por el login
   web; espera a que yo lo complete.
6. Explica qué versión de .NET usará el contenedor y por qué.
7. Propón solo el primer paso pequeño.
8. Hazme dos preguntas breves para comprobar que entendí.
9. Espera mi respuesta y autorización antes de continuar.
```

## 6. Adaptar el prompt a tu propio proyecto

No necesitas conservar .NET ni el negocio de comida. Modifica solamente estas secciones al comenzar:

| Sección | Qué debes cambiar |
|---|---|
| Tu experiencia | Lo que ya sabes y lo que nunca has hecho |
| Proyecto | Un problema pequeño que realmente quieras resolver |
| Tecnologías | El lenguaje, framework, base de datos y herramientas elegidas |
| Límites | Patrones o servicios que no necesitas todavía |
| Conceptos | Lo que quieres aprender durante el proyecto |
| Etapas | Resultados pequeños, ejecutables y en orden |

Por ejemplo, para aprender frontend podrías reemplazar el proyecto por una lista de tareas con HTML, CSS, TypeScript y React. Para Python, podrías construir la misma API con FastAPI y SQLAlchemy. Conserva siempre las reglas de mentoría, las pistas progresivas y la obligación de verificar cada etapa.

## 7. Hábitos para pasar de “copiar” a aprender

Usa estas preguntas durante todo el proyecto:

```text
Explícame este cambio línea por línea, pero no lo modifiques todavía.
```

```text
¿Qué parte debería intentar yo? Dame solo la primera pista.
```

```text
Revisa mi solución. Señala primero el error conceptual y no escribas aún la
solución completa.
```

```text
¿Cómo puedo comprobar que esto funciona? Propón la prueba más pequeña.
```

```text
Muéstrame el flujo completo desde la entrada del usuario hasta el resultado.
```

```text
Hazme tres preguntas para comprobar que podría explicar este código sin tu ayuda.
```

Y mantén estas reglas:

* Haz un *commit* pequeño cuando una etapa funcione.
* Pide una explicación antes de aceptar una dependencia nueva.
* Lee los errores completos antes de pedir una solución.
* Revisa cada archivo modificado y cada comando propuesto.
* No uses el agente para código que no podrías explicar al día siguiente.

## ¿Cuándo termina la guía?

No termina cuando la IA genera el último endpoint. Termina cuando puedes cerrar el chat y explicar por tu cuenta:

* cómo inicia la aplicación;
* cómo viaja una petición por el sistema;
* dónde vive la lógica y dónde se guardan los datos;
* cómo probar el comportamiento;
* y cómo diagnosticar un fallo básico.

Ese es el verdadero camino de **0 a Senior AI**: no pedir más código, sino aprender a hacer mejores preguntas, verificar las respuestas y tomar decisiones propias.
