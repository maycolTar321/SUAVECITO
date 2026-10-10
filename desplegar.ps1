param (
    [Parameter(Mandatory=$false)][string]$GitHubRepoUrl
)

Write-Host "================================================="
Write-Host "  🚀 SCRIPT DE DESPLIEGUE - SMTDE"
Write-Host "  GITHUB & VERCEL"
Write-Host "================================================="
Write-Host ""

# 1. GIT CONFIGURATION Y PUSH
Write-Host "[1/3] Preparando el repositorio Git..." -ForegroundColor Cyan
if (-Not (Test-Path ".git")) {
    git init
    git branch -M main
    Write-Host "Repositorio inicializado." -ForegroundColor Green
}

git add .
git commit -m "Actualización del sistema SMTDE - Despliegue automático"

if ($GitHubRepoUrl) {
    # Comprobar si ya existe el remote 'origin'
    $remoteExists = git remote -v | Select-String "origin"
    if (-Not $remoteExists) {
        git remote add origin $GitHubRepoUrl
    } else {
        git remote set-url origin $GitHubRepoUrl
    }
    
    Write-Host "Subiendo a GitHub ($GitHubRepoUrl)..." -ForegroundColor Cyan
    git push -u origin main
    Write-Host "¡Subida a GitHub completada!" -ForegroundColor Green
} else {
    Write-Host "⚠️ No se proporcionó URL de GitHub. Saltando la subida a GitHub." -ForegroundColor Yellow
    Write-Host "Para subir a GitHub, ejecuta: .\desplegar.ps1 -GitHubRepoUrl 'https://github.com/tu-usuario/tu-repo.git'" -ForegroundColor Yellow
}

Write-Host ""
# 2. DESPLIEGUE EN VERCEL
Write-Host "[2/3] Iniciando despliegue en Vercel..." -ForegroundColor Cyan
Write-Host "Se utilizará 'npx vercel' para desplegar sin necesidad de instalar la CLI globalmente." -ForegroundColor Yellow
Write-Host "NOTA: Si es la primera vez, Vercel te pedirá iniciar sesión e ingresar algunas configuraciones por defecto (presiona Enter a todo)." -ForegroundColor Yellow
Write-Host ""

# Ejecutar Vercel (modo preview/desarrollo)
npx vercel

Write-Host ""
# 3. DESPLIEGUE EN PRODUCCIÓN
Write-Host "[3/3] ¿Deseas lanzar esta versión a PRODUCCIÓN en Vercel?" -ForegroundColor Cyan
$respuesta = Read-Host "(s/n)"

if ($respuesta -eq 's' -or $respuesta -eq 'S') {
    Write-Host "Lanzando a producción..." -ForegroundColor Cyan
    npx vercel --prod
    Write-Host "¡Despliegue en producción completado!" -ForegroundColor Green
} else {
    Write-Host "Despliegue en producción omitido. Solo se generó la vista previa." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "================================================="
Write-Host " ✅ PROCESO FINALIZADO"
Write-Host "================================================="
