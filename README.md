# SGIAC_IA: Sistema de Gestión de Inventario con Análisis Conversacional
Este proyecto es una solución integral que combina el poder de .NET 9, SQL Server y la inteligencia artificial de Dialogflow para permitir la consulta de inventarios mediante lenguaje natural diseñado por Yupanqui Oliva Darian.

## 🛠️ Estructura del Proyecto
El sistema sigue una arquitectura multicapa diseñada para ser fluida y robusta:

/Controllers: Contiene el ChatbotController.cs, el Webhook que procesa el JSON de Dialogflow y ejecuta consultas SQL parametrizadas.

/wwwroot: Aloja la interfaz web (index.html) y los recursos estáticos del widget de asistencia cognitiva.

Program.cs: Punto de entrada de la aplicación donde se configuran los servicios de archivos estáticos y el mapeo de la API.

bd.sql: Script detallado para la creación de la base de datos SGIAC y la tabla Productos.

🚀 Instalación y Configuración
# 1. Persistencia de Datos
Ejecute el script bd.sql en su instancia de SQL Server.

El script cargará productos de prueba como Monitor (10 unidades) y Ratón (15 unidades).

# 2. Configuración del Backend (.NET)
Abra la solución en Visual Studio.

Verifique la connectionString en ChatbotController.cs para asegurar la conexión con su servidor local.

Ejecute la aplicación (F5). El servidor servirá el frontend automáticamente gracias a UseStaticFiles().

# 3. Integración con Dialogflow (NLP)
Utilice ngrok para exponer su puerto local (ej. ngrok http 5000).

En la consola de Dialogflow, active el Fulfillment y coloque la URL generada seguida de /api/chatbot.

Asegúrese de que las frases de entrenamiento estén limpias de etiquetas HTML para un procesamiento óptimo.

📖 Manual de Uso
Inicie la aplicación y abra el navegador en la raíz del proyecto.

Interactúe con el chat flotante.

Realice consultas como: "¿Cuántos monitores hay?" o "Stock de ratones".

El sistema validará el parámetro (Slot Filling) y devolverá la cifra exacta desde la base de datos