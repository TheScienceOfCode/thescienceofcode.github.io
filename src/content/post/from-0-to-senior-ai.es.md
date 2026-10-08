---
title: "From 0 to Senior AI: Codex o Claude en VS Code"
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
- vscode
- learning
- dotnet
- backend
keywords:
- codex
- claude code
- vscode
- inteligencia artificial
- aprender programación
- prompt
- dotnet
- backend
autoThumbnail: true
autoThumbnailText: <i class="fas fa-robot"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff;
coverSize: min
coverStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff
cardUseImage: false
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Instala un agente de programación en **VS Code** y úsalo como mentor para aprender mientras construyes un proyecto real, incluso si estás empezando desde cero.
<!--more-->

Un agente como **Codex** o **Claude Code** puede leer los archivos de tu proyecto, explicarte código, proponer cambios y ejecutar comandos. Eso no lo convierte en infalible ni te convierte automáticamente en *senior*: el objetivo de esta guía es que la IA acelere tu aprendizaje **sin reemplazar tu criterio**.

{{< toc center >}}

---

## 1. Instalar VS Code

Descarga [Visual Studio Code desde su sitio oficial](https://code.visualstudio.com/Download) y ejecuta el instalador correspondiente a tu sistema:

* **Windows:** descarga el instalador de usuario (`.exe`) y sigue el asistente.
* **macOS:** abre el archivo `.dmg` y arrastra Visual Studio Code a **Applications**.
* **Linux:** descarga el paquete `.deb` o `.rpm` apropiado para tu distribución e instálalo con el gestor de paquetes.

La [guía oficial de inicio de VS Code](https://code.visualstudio.com/docs/getstarted/overview) contiene instrucciones actualizadas si encuentras algún problema.

> VS Code es el editor. Para compilar y ejecutar un proyecto también necesitarás las herramientas de su tecnología: por ejemplo, el SDK de .NET, Node.js, Python o Java. El agente puede ayudarte a identificar lo que falta, pero instala cada herramienta desde su fuente oficial.

## 2. Elegir e instalar un agente

Para comenzar solo necesitas **uno**. Codex y Claude Code cumplen un papel parecido dentro del editor; elige según la cuenta o suscripción que ya tengas. Siempre verifica el nombre del publicador antes de instalar una extensión.

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

## 3. Abrir un proyecto correctamente

Un agente trabaja mejor cuando puede ver la carpeta completa y no solamente un archivo aislado:

1. Crea una carpeta vacía para tu proyecto.
2. En VS Code selecciona **File → Open Folder** y abre esa carpeta.
3. Si VS Code muestra **Workspace Trust**, marca la carpeta como confiable únicamente si conoces su contenido.
4. Abre el panel de Codex o Claude Code.

También puedes hacerlo desde una terminal ubicada dentro de la carpeta:

```bash
code .
```

Antes de permitir cambios grandes, conviene instalar [Git](https://git-scm.com/downloads) y crear un primer punto de control:

```bash
git init
git add .
git commit -m "Inicio del proyecto"
```

Así podrás revisar exactamente qué cambió y regresar a una versión anterior. No apruebes un comando que no entiendas y nunca pegues contraseñas, tokens, llaves privadas ni archivos con secretos en el chat.

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

Un buen prompt establece el proyecto, tu nivel, las tecnologías, los límites y la forma de trabajo. El siguiente está listo para estudiar y reconstruir una API de práctica con **C#, ASP.NET Core, PostgreSQL y Docker**. La aplicación terminada y la [versión canónica del prompt están disponibles en GitHub](https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai). Pégalo como primer mensaje en una conversación nueva de Codex o Claude Code.

Para este taller recomendamos como mínimo **GPT-5.6 Sol con esfuerzo medium** en Codex o **Claude Opus 5.5 con esfuerzo medium** en Claude Code. Un modelo posterior también funciona; no es necesario aumentar el esfuerzo para cada paso pequeño.

> Este prompt está diseñado para aprender. El agente debe avanzar contigo, no terminar todo el repositorio por su cuenta.

```text
Vas a actuar como mi mentor de backend en .NET, no como un desarrollador
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
para compilar y ejecutar la API, correr las pruebas y levantar PostgreSQL.

Antes de escribir código, identifica mi sistema operativo y comprueba si Docker
y Docker Compose están disponibles. Si faltan, explícame cómo instalarlos desde
la documentación oficial de mi sistema. Antes de ejecutar un instalador, usar
privilegios de administrador o modificar la configuración del sistema, muéstrame
el comando, explica su efecto y pide mi autorización explícita.

Después verifica la instalación con `docker --version`,
`docker compose version` y `docker run --rm hello-world`.

La versión de .NET está fijada por `global.json` y el `Dockerfile`. No la cambies
sin una razón concreta y mi aprobación.

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
- Explicar `Dockerfile`, `docker-compose.yml` y `global.json`.
- Explicar qué es ASP.NET Core.
- Construir y ejecutar la aplicación con Docker Compose.
- Explicar Program.cs y el archivo del proyecto.
- Explicar cómo inicia la aplicación.
- Usar Swagger para llamar un primer endpoint.

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
3. Si falta Docker, propón el procedimiento oficial para mi sistema y espera mi
   autorización antes de instalarlo.
4. Explica qué versión de .NET usará el contenedor y por qué.
5. Propón solo el primer paso pequeño.
6. Hazme dos preguntas breves para comprobar que entendí.
7. Espera mi respuesta y autorización antes de continuar.
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
