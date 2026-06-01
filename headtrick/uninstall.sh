#!/bin/bash

# ============================================
# 🎯 HeadTrick - Desinstalar Otimizações
# ============================================
# Restaura as configurações padrão
# ============================================

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}============================================${NC}"
echo -e "${MAGENTA}     🎯 HeadTrick - Desinstalando${NC}"
echo -e "${MAGENTA}============================================${NC}"
echo ""

# Verificar ADB
if ! command -v adb &> /dev/null; then
    echo -e "${RED}❌ ADB não encontrado!${NC}"
    exit 1
fi

echo -e "${YELLOW}⚠️  Restaurando configurações padrão...${NC}"
echo ""

# Resetar input settings
echo "👆 Restaurando latência de toque..."
adb shell cmd device_config put input_native_boot input_event_timeout_ms 4 2>/dev/null
adb shell cmd device_config put input_native_boot max_events_per_second 240 2>/dev/null
adb shell cmd device_config put input_native_boot touch_slop 1 2>/dev/null

# Resetar gyro
echo "🎯 Restaurando gyroscópio..."
adb shell settings delete secure gyro_sensitivity 2>/dev/null
adb shell settings delete secure gyro_deadzone 2>/dev/null

# Resetar animações
echo "🎨 Restaurando animações do sistema..."
adb shell settings put global window_animation_scale 1 2>/dev/null
adb shell settings put global transition_animation_scale 1 2>/dev/null

# Resetar system props
echo "⚙️ Resetando System Props..."
adb shell setprop ro.hwui.drop_shadow_cache_size 48 2>/dev/null
adb shell settings put secure long_press_timeout 400 2>/dev/null
adb shell settings put secure multi_press_timeout 300 2>/dev/null

echo ""
echo -e "${GREEN}✅ HeadTrick desinstalado!${NC}"
echo -e "${YELLOW}Configurações padrão restauradas.${NC}"
