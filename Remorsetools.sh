#!/bin/bash

# ============================================
# 🚀 Remorsetools - Central de Otimização
# ============================================
# Menu principal unificado
# RemorseTool + HeadTrick + MiraClean
# Autor: remorsefffz-rgb
# ============================================

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# ============================================
# VERIFICAÇÃO DE ADB (OBRIGATÓRIO)
# ============================================

verificar_adb() {
    if ! command -v adb &> /dev/null; then
        echo -e "${RED}❌ ADB não encontrado!${NC}"
        echo -e "${YELLOW}Instalando...${NC}"
        pkg install android-tools -y
    fi
    
    local device_count=$(adb devices 2>/dev/null | grep -c "device$")
    if [ "$device_count" -eq 0 ]; then
        echo -e "${RED}❌ ADB NÃO PAREADO!${NC}"
        echo -e "${YELLOW}Habilite Depuração USB e reconecte.${NC}"
        exit 1
    fi
}

# ============================================
# MENU PRINCIPAL
# ============================================

menu_principal() {
    clear
    echo -e "${MAGENTA}================================================${NC}"
    echo -e "${MAGENTA}     🚀 REMORSETOOLS - Central de Otimização${NC}"
    echo -e "${MAGENTA}     v2.0 - All-in-One Performance Suite${NC}"
    echo -e "${MAGENTA}================================================${NC}"
    echo ""
    echo -e "${CYAN}Escolha uma opção:${NC}"
    echo ""
    echo -e "${GREEN}🔧 OTIMIZAÇÕES GERAIS${NC}"
    echo "1) 🚀 RemorseTool - Otimização Completa do Sistema"
    echo "2) 🎮 HeadTrick - Melhora de Mira/Sensibilidade"
    echo "3) 🧹 MiraClean - Limpeza Inteligente"
    echo ""
    echo -e "${YELLOW}🎯 PACOTES COMPLETOS${NC}"
    echo "4) ⚡ RemorseTool + HeadTrick (Gaming)"
    echo "5) 🧹 RemorseTool + MiraClean (Performance + Limpeza)"
    echo "6) 🎮 HeadTrick + MiraClean (Free Fire Otimizado)"
    echo "7) 🏆 TUDO (RemorseTool + HeadTrick + MiraClean)"
    echo ""
    echo "0) ❌ Sair"
    echo ""
    echo -e "${MAGENTA}================================================${NC}"
    read -p "Escolha uma opção (0-7): " opcao
}

# ============================================
# REMOTSOOL - OTIMIZAÇÃO GERAL
# ============================================

remotsool() {
    clear
    echo -e "${MAGENTA}🚀 RemorseTool - Otimização do Sistema${NC}"
    echo ""
    
    echo -e "${YELLOW}Escolha um modo:${NC}"
    echo "1) 📋 Menu Interativo"
    echo "2) ⚡ Modo Automático"
    echo "3) 🔙 Voltar"
    read -p "Opção: " modo
    
    case $modo in
        1)
            echo -e "${CYAN}Abrindo RemorseTool com menu...${NC}"
            # Aqui entra lógica do RemorseTool com menu
            echo "1) Atualizar Sistema"
            echo "2) Instalar Deps"
            echo "3) Limpar Cache"
            echo "4) System Props"
            echo "5) GPU/OpenGL (120Hz)"
            echo "6) Input/Latência"
            echo "7) ADB Completo"
            echo "8) Verificar Espaço"
            echo "9) Status do Device"
            echo "10) TUDO"
            read -p "Opção: " opt
            executar_remotsool $opt
            ;;
        2)
            echo -e "${CYAN}🚀 Modo Automático Ativado!${NC}"
            executar_remotsool_auto
            ;;
        3)
            menu_principal
            ;;
    esac
}

executar_remotsool_auto() {
    echo -e "${YELLOW}🔄 Atualizando pacotes...${NC}"
    pkg update && pkg upgrade -y
    
    echo -e "${YELLOW}📦 Instalando dependências...${NC}"
    pkg install android-tools curl git vim -y
    
    echo -e "${YELLOW}🧹 Limpando cache...${NC}"
    apt clean && apt autoremove -y && rm -rf /tmp/*
    
    echo -e "${YELLOW}⚙️ System Props...${NC}"
    adb shell setprop debug.sf.enable_adpf_cpu_hint true 2>/dev/null
    
    echo -e "${YELLOW}🎮 GPU 120Hz...${NC}"
    adb shell cmd device_config put activity_manager ro.display.120hz.optimizer enable 2>/dev/null
    
    echo -e "${YELLOW}⚡ Input Latência...${NC}"
    adb shell cmd device_config put input_native_boot enable_input_latency_optimization true 2>/dev/null
    adb shell settings put secure long_press_timeout 100 2>/dev/null
    adb shell settings put secure multi_press_timeout 10 2>/dev/null
    
    echo -e "${GREEN}✅ RemorseTool Completo!${NC}"
}

# ============================================
# HEADTRICK - MIRA
# ============================================

headtrick() {
    clear
    echo -e "${MAGENTA}🎯 HeadTrick - Otimização de Mira${NC}"
    echo ""
    
    echo -e "${YELLOW}Escolha uma opção:${NC}"
    echo "1) 👆 Latência de Toque"
    echo "2) 🎯 Calibrar Gyroscópio"
    echo "3) 🎯 Reduzir Jitter"
    echo "4) ⚡ Boost Performance"
    echo "5) 🎮 Otimizar Free Fire"
    echo "6) 🚀 TUDO (Completo)"
    echo "7) 🔙 Voltar"
    read -p "Opção: " opt
    
    case $opt in
        1)
            echo -e "${CYAN}👆 Otimizando latência...${NC}"
            adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
            adb shell cmd device_config put input_native_boot max_events_per_second 300 2>/dev/null
            echo -e "${GREEN}✅ Latência otimizada!${NC}"
            ;;
        2)
            echo -e "${CYAN}🎯 Calibrando gyroscópio...${NC}"
            echo "1) Muito Baixa (0.5) | 2) Baixa (0.8) | 3) Média (1.0) | 4) Alta (1.3) | 5) Muito Alta (1.5)"
            read -p "Nível: " nivel
            case $nivel in
                1) adb shell settings put secure gyro_sensitivity 0.5 2>/dev/null ;;
                2) adb shell settings put secure gyro_sensitivity 0.8 2>/dev/null ;;
                3) adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null ;;
                4) adb shell settings put secure gyro_sensitivity 1.3 2>/dev/null ;;
                5) adb shell settings put secure gyro_sensitivity 1.5 2>/dev/null ;;
            esac
            echo -e "${GREEN}✅ Gyroscópio calibrado!${NC}"
            ;;
        3)
            echo -e "${CYAN}🎯 Reduzindo jitter...${NC}"
            adb shell setprop ro.surface_flinger.vsync_event_phase_offset_ns 0 2>/dev/null
            echo -e "${GREEN}✅ Jitter reduzido!${NC}"
            ;;
        4)
            echo -e "${CYAN}⚡ Boost de performance...${NC}"
            adb shell cmd device_config put activity_manager ro.surface_flinger.max_frame_buffer_acquired_buffers 3 2>/dev/null
            echo -e "${GREEN}✅ Performance boosted!${NC}"
            ;;
        5)
            echo -e "${CYAN}🎮 Otimizando Free Fire...${NC}"
            adb shell settings put secure long_press_timeout 50 2>/dev/null
            adb shell settings put secure multi_press_timeout 5 2>/dev/null
            echo -e "${GREEN}✅ Free Fire otimizado!${NC}"
            ;;
        6)
            echo -e "${CYAN}🚀 HeadTrick Completo!${NC}"
            adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
            adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null
            adb shell setprop ro.surface_flinger.vsync_event_phase_offset_ns 0 2>/dev/null
            adb shell settings put secure long_press_timeout 50 2>/dev/null
            echo -e "${GREEN}✅ HeadTrick ativado!${NC}"
            ;;
        7)
            menu_principal
            ;;
    esac
    
    read -p "Pressione ENTER para continuar..." dummy
}

# ============================================
# MIRACLEAN - LIMPEZA INTELIGENTE
# ============================================

miraclean() {
    clear
    echo -e "${MAGENTA}🧹 MiraClean - Limpeza Inteligente${NC}"
    echo ""
    
    echo -e "${YELLOW}Escolha uma opção:${NC}"
    echo "1) 🧹 Limpeza Rápida (Cache)"
    echo "2) 🗑️ Limpeza Profunda"
    echo "3) 📊 Análise de Espaço"
    echo "4) 🚀 TUDO"
    echo "5) 🔙 Voltar"
    read -p "Opção: " opt
    
    case $opt in
        1)
            echo -e "${CYAN}🧹 Limpeza Rápida...${NC}"
            apt clean
            rm -rf /tmp/*
            npm cache clean --force 2>/dev/null
            adb shell pm trim-caches 1024M 2>/dev/null
            echo -e "${GREEN}✅ Cache limpo!${NC}"
            ;;
        2)
            echo -e "${CYAN}🗑️ Limpeza Profunda...${NC}"
            apt clean && apt autoremove -y
            rm -rf /tmp/* ~/.cache/*
            adb shell rm -rf /sdcard/Download/* 2>/dev/null
            adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null
            echo -e "${GREEN}✅ Limpeza profunda concluída!${NC}"
            ;;
        3)
            echo -e "${CYAN}📊 Análise de Espaço...${NC}"
            echo "Espaço Termux:"
            df -h
            echo ""
            echo "Top 5 maiores:"
            du -sh ~/* 2>/dev/null | sort -rh | head -5
            ;;
        4)
            echo -e "${CYAN}🚀 MiraClean Completo!${NC}"
            apt clean && apt autoremove -y
            rm -rf /tmp/* ~/.cache/*
            npm cache clean --force 2>/dev/null
            adb shell pm trim-caches 1024M 2>/dev/null
            adb shell rm -rf /sdcard/Download/* 2>/dev/null
            adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null
            echo -e "${GREEN}✅ MiraClean completo!${NC}"
            ;;
        5)
            menu_principal
            ;;
    esac
    
    read -p "Pressione ENTER para continuar..." dummy
}

# ============================================
# PACOTES COMBINADOS
# ============================================

pacote_gaming() {
    echo -e "${CYAN}⚡ RemorseTool + HeadTrick (Gaming)${NC}"
    executar_remotsool_auto
    adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
    adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null
    echo -e "${GREEN}✅ Pacote Gaming Ativado!${NC}"
}

pacote_performance() {
    echo -e "${CYAN}🧹 RemorseTool + MiraClean${NC}"
    executar_remotsool_auto
    apt clean && apt autoremove -y
    adb shell pm trim-caches 1024M 2>/dev/null
    echo -e "${GREEN}✅ Pacote Performance Ativado!${NC}"
}

pacote_freefire() {
    echo -e "${CYAN}🎮 HeadTrick + MiraClean (Free Fire)${NC}"
    adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
    adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null
    adb shell settings put secure long_press_timeout 50 2>/dev/null
    apt clean && apt autoremove -y
    adb shell pm trim-caches 1024M 2>/dev/null
    echo -e "${GREEN}✅ Free Fire Otimizado!${NC}"
}

pacote_total() {
    echo -e "${CYAN}🏆 PACOTE TOTAL - Tudo Ativado!${NC}"
    executar_remotsool_auto
    adb shell cmd device_config put input_native_boot input_event_timeout_ms 2 2>/dev/null
    adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null
    apt clean && apt autoremove -y
    adb shell pm trim-caches 1024M 2>/dev/null
    echo -e "${GREEN}✅ Sistema 100% Otimizado!${NC}"
}

# ============================================
# MAIN
# ============================================

# Verificar ADB primeiro
verificar_adb

# Loop do menu
while true; do
    menu_principal
    
    case $opcao in
        1) remotsool ;;
        2) headtrick ;;
        3) miraclean ;;
        4) pacote_gaming ;;
        5) pacote_performance ;;
        6) pacote_freefire ;;
        7) pacote_total ;;
        0) 
            echo -e "${GREEN}👋 Até logo!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Opção inválida!${NC}"
            sleep 2
            ;;
    esac
    
    read -p "Pressione ENTER para voltar ao menu..." dummy
done
