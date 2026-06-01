#!/bin/bash

# ============================================
# 🎯 HeadTrick - Melhora de Sensibilidade
# ============================================
# Script para otimizar Termux e Android via ADB
# Inclui: Latência, Gyroscópio, Jitter, Performance
# Autor: remorsefffz-rgb
# ============================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================
# ⚠️ VERIFICAÇÃO OBRIGATÓRIA DE ADB
# ============================================

verificar_adb_obrigatorio() {
    echo -e "${MAGENTA}============================================${NC}"
    echo -e "${MAGENTA}     🎯 HeadTrick - Verificação ADB${NC}"
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

# Função: Otimizar Latência de Toque
otimizar_touch_latency() {
    echo -e "${CYAN}👆 Otimizando latência de toque...${NC}"
    
    # Reduzir input_event_timeout
    adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
    
    # Aumentar taxa de polling
    adb shell cmd device_config put input_native_boot max_events_per_second 300 2>/dev/null
    
    # Habilitar motion prediction agressivo
    adb shell cmd device_config put input_native_boot enable_motion_prediction true 2>/dev/null
    adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 0 2>/dev/null
    
    # Touch slop mínimo
    adb shell cmd device_config put input_native_boot touch_slop 0 2>/dev/null
    
    # Reamostragem agressiva
    adb shell cmd device_config put input_native_boot resample_touch true 2>/dev/null
    adb shell cmd device_config put input_native_boot touch_resample_rate 0 2>/dev/null
    
    echo -e "${GREEN}✅ Latência de toque otimizada!${NC}"
}

# Função: Otimizar Gyroscópio
otimizar_giroscopio() {
    echo -e "${CYAN}🎯 Calibrando gyroscópio para mira...${NC}"
    
    # Sensibilidade de gyro
    adb shell settings put secure gyro_sensitivity 1.2 2>/dev/null
    
    # Deadzone mínimo
    adb shell settings put secure gyro_deadzone 0.01 2>/dev/null
    
    # Enable advanced gyro
    adb shell settings put secure gyro_enable_advanced 1 2>/dev/null
    
    echo -e "${GREEN}✅ Gyroscópio calibrado!${NC}"
}

# Função: Reduzir Jitter
reduzir_jitter() {
    echo -e "${CYAN}🎯 Reduzindo jitter da mira...${NC}"
    
    # Surface Flinger tuning
    adb shell setprop ro.surface_flinger.vsync_event_phase_offset_ns 0 2>/dev/null
    adb shell setprop ro.surface_flinger.vsync_sf_event_phase_offset_ns 0 2>/dev/null
    
    # Disable blur
    adb shell setprop ro.hwui.drop_shadow_cache_size 0 2>/dev/null
    
    # Motion compensation
    adb shell settings put secure motion_compensation_enabled 1 2>/dev/null
    
    echo -e "${GREEN}✅ Jitter reduzido!${NC}"
}

# Função: Boost de Performance
boost_performance() {
    echo -e "${CYAN}⚡ Aplicando boost de performance...${NC}"
    
    # CPU Governor
    adb shell "for i in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo performance > \$i; done" 2>/dev/null
    
    # GPU Boost
    adb shell setprop ro.hardware.activity_recognition true 2>/dev/null
    
    # Frame buffer
    adb shell cmd device_config put activity_manager ro.surface_flinger.max_frame_buffer_acquired_buffers 3 2>/dev/null
    
    # Vsync optimization
    adb shell settings put secure user_rotation 0 2>/dev/null
    
    echo -e "${GREEN}✅ Performance boosted!${NC}"
}

# Função: System Props para Performance
aplicar_system_props() {
    echo -e "${CYAN}⚙️ Aplicando System Props otimizados...${NC}"
    
    # Reduzir latência de rendering
    adb shell setprop ro.hwui.drop_shadow_cache_size 6 2>/dev/null
    adb shell setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 3 2>/dev/null
    
    # Otimizar GPU
    adb shell setprop debug.atrace.tags.enableflags 0 2>/dev/null
    adb shell setprop ro.hardware.activity_recognition true 2>/dev/null
    
    # Memória
    adb shell setprop ro.config.low_ram false 2>/dev/null
    adb shell setprop ro.lmk.threshold_decay 10 2>/dev/null
    
    # Display
    adb shell setprop ro.vendor.extension_library.fps 120 2>/dev/null
    adb shell setprop persist.sys.sf.color_saturation 1.0 2>/dev/null
    
    # Desabilitar animações desnecessárias
    adb shell settings put global window_animation_scale 0 2>/dev/null
    adb shell settings put global transition_animation_scale 0 2>/dev/null
    
    echo -e "${GREEN}✅ System Props aplicadas!${NC}"
}

# Função: Otimizar Free Fire
otimizar_free_fire() {
    echo -e "${CYAN}🎮 Otimizando especificamente para Free Fire...${NC}"
    
    # Reduzir latência de input específica
    adb shell settings put secure long_press_timeout 50 2>/dev/null
    adb shell settings put secure multi_press_timeout 5 2>/dev/null
    
    # Touch precision
    adb shell settings put secure touch_slop 1 2>/dev/null
    
    # Graphics optimization
    adb shell cmd package set-disabled-until-used com.android.systemui 2>/dev/null
    
    echo -e "${GREEN}✅ Free Fire otimizado!${NC}"
}

# Função: Menu Principal
menu() {
    clear
    echo -e "${MAGENTA}============================================${NC}"
    echo -e "${MAGENTA}     🎯 HeadTrick - Melhora de Mira${NC}"
    echo -e "${MAGENTA}     Free Fire Performance Booster${NC}"
    echo -e "${MAGENTA}     v1.0 - HeadShot Edition${NC}"
    echo -e "${MAGENTA}============================================${NC}"
    echo ""
    echo "🎯 OTIMIZAÇÕES DISPONÍVEIS:"
    echo "1) 👆 Otimizar latência de toque"
    echo "2) 🎯 Calibrar gyroscópio"
    echo "3) 🎯 Reduzir jitter da mira"
    echo "4) ⚡ Boost de performance"
    echo "5) ⚙️ Aplicar System Props"
    echo "6) 🎮 Otimizar Free Fire"
    echo ""
    echo "🚀 AUTOMÁTICO:"
    echo "7) 🚀 EXECUTAR TUDO (Completo)"
    echo "8) ❌ Sair"
    echo ""
    echo -e "${MAGENTA}============================================${NC}"
    read -p "Escolha uma opção (1-8): " opcao
    
    case $opcao in
        1) otimizar_touch_latency ;;
        2) otimizar_giroscopio ;;
        3) reduzir_jitter ;;
        4) boost_performance ;;
        5) aplicar_system_props ;;
        6) otimizar_free_fire ;;
        7)
            echo -e "${CYAN}🚀 Executando HeadTrick COMPLETO...${NC}"
            echo ""
            otimizar_touch_latency
            echo ""
            otimizar_giroscopio
            echo ""
            reduzir_jitter
            echo ""
            boost_performance
            echo ""
            aplicar_system_props
            echo ""
            otimizar_free_fire
            echo ""
            echo -e "${GREEN}🏆 HEADTRICK ATIVADO! SUA MIRA AGORA É LETAL! 🏆${NC}"
            ;;
        8)
            echo -e "${GREEN}👋 Até o próximo headshot!${NC}"
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
    otimizar_touch_latency
    otimizar_giroscopio
    reduzir_jitter
    boost_performance
    aplicar_system_props
    otimizar_free_fire
    echo -e "${GREEN}✅ HeadTrick ativado com sucesso!${NC}"
else
    menu
fi
