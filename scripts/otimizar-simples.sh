#!/bin/bash

# ============================================
# 🧹 Otimização Simples - RemorseTool
# ============================================
# Executa tudo automaticamente sem menu
# Inclui todas as otimizações disponíveis
# ============================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
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

# Verificação obrigatória de ADB PRIMEIRO
verificar_adb_obrigatorio

echo "🚀 RemorseTool - Otimização Completa (Modo Automático)"
echo "====================================================="
echo ""

echo "🔄 Atualizando pacotes..."
pkg update && pkg upgrade -y

echo "📦 Instalando dependências..."
pkg reinstall curl libcurl -y
pkg install android-tools -y
pkg install git vim -y

echo "🧹 Limpando cache Termux..."
apt clean
apt autoremove -y
rm -rf /tmp/*
npm cache clean --force 2>/dev/null

echo ""
echo "⚙️ Aplicando System Props..."
adb shell setprop debug.sf.enable_adpf_cpu_hint true 2>/dev/null
adb shell setprop debug.sf.use_phase_offsets_as_durations 1 2>/dev/null

echo "🎮 Otimizando GPU/OpenGL (120Hz)..."
adb shell cmd device_config put activity_manager ro.display.120hz.optimizer enable 2>/dev/null
adb shell cmd device_config put activity_manager ro.display.hz.optimizer enable 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VARYING_VECTORS 31 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_ATTRIBS 32 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_OUTPUT_COMPONENTS 128 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 16 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_BLOCKS 14 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_VECTORS 256 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_COMPONENTS 1024 2>/dev/null
adb shell cmd device_config put activity_manager GL_MAX_TEXTURE_IMAGE_UNITS 16 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_HEIGHT 16384 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_WIDTH 16384 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_DEPTH 2048 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_HEIGHT 16384 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_WIDTH 16384 2>/dev/null
adb shell cmd device_config put activity_manager CL_DEVICE_LOCAL_MEM_SIZE 32768 2>/dev/null

echo "⚡ Otimizando Input/Latência..."
adb shell cmd device_config put input_native_boot enable_input_latency_optimization true 2>/dev/null
adb shell cmd device_config put input_native_boot input_event_timeout_ms 4 2>/dev/null
adb shell cmd device_config put input_native_boot enable_motion_prediction true 2>/dev/null
adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 1 2>/dev/null
adb shell cmd device_config put input_native_boot resample_touch true 2>/dev/null
adb shell cmd device_config put input_native_boot touch_resample_rate 1 2>/dev/null
adb shell cmd device_config put input_native_boot max_events_per_second 240 2>/dev/null
adb shell cmd device_config put input_native_boot enable_touch_resampling true 2>/dev/null
adb shell cmd device_config put input_native_boot touch_slop 1 2>/dev/null

echo "⏱️ Ajustando timeouts de toque..."
adb shell settings put secure long_press_timeout 100 2>/dev/null
adb shell settings put secure multi_press_timeout 10 2>/dev/null

echo "🔧 Otimizações ADB..."
adb shell pm trim-caches 1024M 2>/dev/null
adb shell rm -rf /sdcard/Download/* 2>/dev/null
adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null

echo ""
echo "📊 Espaço em disco:"
df -h
echo ""
echo "🏆 Top 5 maiores:"
du -sh ~/* 2>/dev/null | sort -rh | head -5

echo ""
echo "✅ Otimização completa!"
echo "🎮 Seu dispositivo agora está super otimizado!"
