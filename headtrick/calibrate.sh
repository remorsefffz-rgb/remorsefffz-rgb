#!/bin/bash

# ============================================
# 🎯 HeadTrick - Calibração de Mira
# ============================================
# Calibra o gyroscópio e sensibilidade
# ============================================

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}============================================${NC}"
echo -e "${MAGENTA}     🎯 HeadTrick - Calibração${NC}"
echo -e "${MAGENTA}============================================${NC}"
echo ""

# Menu de calibração
echo -e "${CYAN}Escolha o nível de sensibilidade:${NC}"
echo ""
echo "1) 🎯 MUITO BAIXA - Para aiming preciso"
echo "2) 🎯 BAIXA - Para controle total"
echo "3) 🎯 MÉDIA - Balanceado"
echo "4) 🎯 ALTA - Para quick flick"
echo "5) 🎯 MUITO ALTA - Para reações rápidas"
echo ""
read -p "Escolha (1-5): " nivel

case $nivel in
    1)
        echo -e "${YELLOW}Configurando MUITO BAIXA...${NC}"
        adb shell settings put secure gyro_sensitivity 0.5 2>/dev/null
        adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 2 2>/dev/null
        echo -e "${GREEN}✅ Sensibilidade MUITO BAIXA aplicada!${NC}"
        ;;
    2)
        echo -e "${YELLOW}Configurando BAIXA...${NC}"
        adb shell settings put secure gyro_sensitivity 0.8 2>/dev/null
        adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 1 2>/dev/null
        echo -e "${GREEN}✅ Sensibilidade BAIXA aplicada!${NC}"
        ;;
    3)
        echo -e "${YELLOW}Configurando MÉDIA...${NC}"
        adb shell settings put secure gyro_sensitivity 1.0 2>/dev/null
        adb shell cmd device_config put input_native_boot motion_prediction_offset_ms 0 2>/dev/null
        echo -e "${GREEN}✅ Sensibilidade MÉDIA aplicada!${NC}"
        ;;
    4)
        echo -e "${YELLOW}Configurando ALTA...${NC}"
        adb shell settings put secure gyro_sensitivity 1.3 2>/dev/null
        adb shell cmd device_config put input_native_boot motion_prediction_offset_ms -1 2>/dev/null
        echo -e "${GREEN}✅ Sensibilidade ALTA aplicada!${NC}"
        ;;
    5)
        echo -e "${YELLOW}Configurando MUITO ALTA...${NC}"
        adb shell settings put secure gyro_sensitivity 1.5 2>/dev/null
        adb shell cmd device_config put input_native_boot motion_prediction_offset_ms -2 2>/dev/null
        echo -e "${GREEN}✅ Sensibilidade MUITO ALTA aplicada!${NC}"
        ;;
    *)
        echo -e "${RED}❌ Opção inválida!${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}💡 Dicas para melhor resultado:${NC}"
echo "- Teste no Free Fire antes de confirmar"
echo "- Jogue um round para acostumar"
echo "- Ajuste novamente se necessário"
echo ""
echo -e "${GREEN}🎯 Calibração concluída!${NC}"
