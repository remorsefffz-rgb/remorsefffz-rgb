#!/bin/bash

# ============================================
# 🚀 RemorseTool - Otimização Termux + ADB
# ============================================
# Script para otimizar Termux e Android via ADB
# Inclui: System Props, GPU, OpenGL, Input, Latência
# Autor: remorsefffz-rgb
# ============================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# ============================================
# ⚠️ VERIFICAÇÃO OBRIGATÓRIA DE ADB
# ============================================

verificar_adb_obrigatorio() {
    echo -e "${MAGENTA}============================================${NC}"
    echo -e "${MAGENTA}     🔌 Verificando Conexão ADB${NC}"
    echo -e "${MAGENTA}============================================${NC}"
    echo ""
    
    # Verificar se ADB está instalado
    if ! command -v adb &> /dev/null; then
        echo -e "${RED}❌ ADB não encontrado!${NC}"
        echo -e "${YELLOW}Instalando android-tools...${NC}"
        pkg install android-tools -y
        echo ""
    fi
    
    # Verificar se dispositivo está conectado
    echo -e "${YELLOW}📱 Verificando dispositivos conectados...${NC}"
    adb devices
    echo ""
    
    # Contar dispositivos conectados
    local device_count=$(adb devices | grep -c "device$")
    
    if [ "$device_count" -eq 0 ]; then
        echo ""
        echo -e "${RED}❌ ADB NÃO PAREADO!${NC}"
        echo ""
        echo -e "${YELLOW}Para conectar o dispositivo:${NC}"
        echo "1️⃣ Ative 'Depuração USB' nas Opções de Desenvolvedor"
        echo "2️⃣ Conecte o USB ao dispositivo"
        echo "3️⃣ Execute novamente"
        echo ""
        echo -e "${YELLOW}Ou para conectar via WiFi:${NC}"
        echo "   adb tcpip 5555"
        echo "   adb connect SEU_IP:5555"
        echo ""
        exit 1
    fi
    
    echo -e "${GREEN}✅ ADB pareado e conectado!${NC}"
    echo ""
}

# Função: Atualizar Sistema
atualizar() {
    echo -e "${YELLOW}🔄 Atualizando pacotes...${NC}"
    pkg update && pkg upgrade -y
    echo -e "${GREEN}✅ Sistema atualizado!${NC}"
}

# Função: Instalar Dependências
instalar_deps() {
    echo -e "${YELLOW}📦 Instalando dependências...${NC}"
    pkg reinstall curl libcurl -y
    pkg install android-tools -y
    pkg install git vim -y
    echo -e "${GREEN}✅ Dependências instaladas!${NC}"
}

# Função: Limpar Cache
limpar_cache() {
    echo -e "${YELLOW}🧹 Limpando cache Termux...${NC}"
    apt clean
    apt autoremove -y
    rm -rf /tmp/*
    npm cache clean --force 2>/dev/null
    echo -e "${GREEN}✅ Cache limpo!${NC}"
}

# Função: Aplicar System Props
aplicar_system_props() {
    echo -e "${YELLOW}⚙️ Aplicando System Props...${NC}"
    
    echo "📱 Aplicando propriedades do sistema..."
    adb shell setprop debug.sf.enable_adpf_cpu_hint true 2>/dev/null
    adb shell setprop debug.sf.use_phase_offsets_as_durations 1 2>/dev/null
    
    echo -e "${GREEN}✅ System Props aplicadas!${NC}"
}

# Função: Otimizar GPU/OpenGL
otimizar_gpu() {
    echo -e "${YELLOW}🎮 Otimizando GPU/OpenGL...${NC}"
    
    echo "🎨 Configurando otimizações de renderização..."
    
    # Otimização de Hz - Mudado para 120Hz
    adb shell cmd device_config put activity_manager ro.display.120hz.optimizer enable 2>/dev/null
    adb shell cmd device_config put activity_manager ro.display.hz.optimizer enable 2>/dev/null
    
    # OpenGL Configs
    adb shell cmd device_config put activity_manager GL_MAX_VARYING_VECTORS 31 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_ATTRIBS 32 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_OUTPUT_COMPONENTS 128 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 16 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_BLOCKS 14 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_VECTORS 256 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_COMPONENTS 1024 2>/dev/null
    adb shell cmd device_config put activity_manager GL_MAX_TEXTURE_IMAGE_UNITS 16 2>/dev/null
    
    # Compute Shaders (OpenCL)
    adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_HEIGHT 16384 2>/dev/null
    adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_WIDTH 16384 2>/dev/null
    adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_DEPTH 2048 2>/dev/null
    adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_HEIGHT 16384 2>/dev/null
    adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_WIDTH 16384 2>/dev/null
    adb shell cmd device_config put activity_manager CL_DEVICE_LOCAL_MEM_SIZE 32768 2>/dev/null
    
    echo -e "${GREEN}✅ GPU/OpenGL otimizado (120Hz)!${NC}"
}

# Função: Otimizar Input/Latência
otimizar_input() {
    echo -e "${YELLOW}⚡ Otimizando Input/Latência de Toque...${NC}"
    
    echo "👆 Configurando latência de entrada..."
    
    adb shell cmd device_config put input_native_boot enable_input_latency_optimization true 2>/dev/null
    adb shell cmd device_config put input_native_boot input_event_timeout_ms 4 2>/dev/null
    adb shell cmd device_config put input_native_boot enable_motion_prediction true 2>/dev/null
    adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 1 2>/dev/null
    adb shell cmd device_config put input_native_boot resample_touch true 2>/dev/null
    adb shell cmd device_config put input_native_boot touch_resample_rate 1 2>/dev/null
    adb shell cmd device_config put input_native_boot max_events_per_second 240 2>/dev/null
    adb shell cmd device_config put input_native_boot enable_touch_resampling true 2>/dev/null
    adb shell cmd device_config put input_native_boot touch_slop 1 2>/dev/null
    
    # Long Press Timeout e Multi Press Timeout
    echo "⏱️ Ajustando timeouts de toque..."
    adb shell settings put secure long_press_timeout 100 2>/dev/null
    adb shell settings put secure multi_press_timeout 10 2>/dev/null
    
    echo -e "${GREEN}✅ Input/Latência otimizado!${NC}"
}

# Função: Otimizar ADB Completo
otimizar_adb() {
    echo -e "${YELLOW}⚡ Otimização Completa via ADB...${NC}"
    
    echo "🧹 Limpando cache do sistema..."
    adb shell pm trim-caches 1024M 2>/dev/null
    
    echo "📥 Limpando pasta Downloads..."
    adb shell rm -rf /sdcard/Download/* 2>/dev/null
    
    echo "🗑️ Limpando cache de apps..."
    adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null
    
    echo -e "${GREEN}✅ ADB otimizado!${NC}"
}

# Função: Verificar Espaço
verificar_espaco() {
    echo -e "${YELLOW}📊 Verificando espaço em disco...${NC}"
    echo ""
    df -h
    echo ""
    echo -e "${BLUE}Top 5 arquivos/pastas maiores:${NC}"
    du -sh ~/* 2>/dev/null | sort -rh | head -5
}

# Função: Status do Dispositivo
status_dispositivo() {
    echo -e "${YELLOW}📱 Status do Dispositivo:${NC}"
    
    echo "🔋 Bateria:"
    adb shell dumpsys battery 2>/dev/null | grep -E "level|temperature"
    
    echo ""
    echo "💾 Armazenamento:"
    adb shell df -h 2>/dev/null | grep "/storage"
}

# Função: Menu Principal
menu() {
    clear
    echo -e "${MAGENTA}============================================${NC}"
    echo -e "${MAGENTA}     🚀 RemorseTool - Otimização${NC}"
    echo -e "${MAGENTA}     Termux + ADB Integration${NC}"
    echo -e "${MAGENTA}     v1.2 - Performance Edition${NC}"
    echo -e "${MAGENTA}============================================${NC}"
    echo ""
    echo "🔧 LIMPEZA & SISTEMA:"
    echo "1) ✅ Atualizar sistema"
    echo "2) 📦 Instalar dependências"
    echo "3) 🧹 Limpar cache"
    echo ""
    echo "⚡ OTIMIZAÇÕES AVANÇADAS:"
    echo "4) ⚙️  Aplicar System Props"
    echo "5) 🎮 Otimizar GPU/OpenGL (120Hz)"
    echo "6) ⚡ Otimizar Input/Latência"
    echo "7) 🔧 Otimização ADB Completa"
    echo ""
    echo "📊 INFORMAÇÕES:"
    echo "8) 📊 Verificar espaço"
    echo "9) 📱 Status do dispositivo"
    echo ""
    echo "🚀 EXECUÇÃO:"
    echo "10) 🚀 EXECUTAR TUDO (Completo)"
    echo "11) ❌ Sair"
    echo ""
    echo -e "${MAGENTA}============================================${NC}"
    read -p "Escolha uma opção (1-11): " opcao
    
    case $opcao in
        1) atualizar ;;
        2) instalar_deps ;;
        3) limpar_cache ;;
        4) aplicar_system_props ;;
        5) otimizar_gpu ;;
        6) otimizar_input ;;
        7) otimizar_adb ;;
        8) verificar_espaco ;;
        9) status_dispositivo ;;
        10) 
            echo -e "${MAGENTA}🚀 Executando TODAS as otimizações...${NC}"
            echo ""
            atualizar
            echo ""
            instalar_deps
            echo ""
            limpar_cache
            echo ""
            aplicar_system_props
            echo ""
            otimizar_gpu
            echo ""
            otimizar_input
            echo ""
            otimizar_adb
            echo ""
            verificar_espaco
            echo ""
            status_dispositivo
            echo ""
            echo -e "${GREEN}🏆 OTIMIZAÇÃO COMPLETA! 🏆${NC}"
            ;;
        11) 
            echo -e "${GREEN}👋 Até logo!${NC}"
            exit 0 
            ;;
        *) 
            echo -e "${RED}❌ Opção inválida!${NC}"
            sleep 2
            menu
            ;;
    esac
    
    echo ""
    read -p "Pressione ENTER para voltar ao menu..." dummy
    menu
}

# ============================================
# MAIN
# ============================================

# Verificação obrigatória de ADB PRIMEIRO
verificar_adb_obrigatorio

# Verificar se é primeira execução
if [ "$1" = "--auto" ]; then
    echo -e "${MAGENTA}🚀 Modo automático ativado!${NC}"
    atualizar
    instalar_deps
    limpar_cache
    aplicar_system_props
    otimizar_gpu
    otimizar_input
    otimizar_adb
    verificar_espaco
    echo -e "${GREEN}✅ Otimização completa!${NC}"
else
    menu
fi
