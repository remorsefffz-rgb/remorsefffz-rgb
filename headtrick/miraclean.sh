#!/bin/bash

# ============================================
# 🧹 MiraClean - Limpeza Inteligente
# ============================================
# Remove arquivos desnecessários
# Otimiza espaço do dispositivo
# ============================================

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}============================================${NC}"
echo -e "${MAGENTA}     🧹 MiraClean - Limpeza Inteligente${NC}"
echo -e "${MAGENTA}     v1.0 - System Cleaner${NC}"
echo -e "${MAGENTA}============================================${NC}"
echo ""

# Verificar ADB
if ! command -v adb &> /dev/null; then
    echo -e "${RED}❌ ADB não encontrado!${NC}"
    exit 1
fi

echo -e "${YELLOW}Escolha o tipo de limpeza:${NC}"
echo ""
echo "1) 🧹 Limpeza Rápida (Cache)"
echo "2) 🗑️ Limpeza Profunda"
echo "3) 📊 Análise de Espaço"
echo "4) 🚀 Limpeza Total"
echo "5) ❌ Sair"
echo ""
read -p "Opção: " opcao

case $opcao in
    1)
        echo -e "${CYAN}🧹 Limpeza Rápida...${NC}"
        echo "Limpando cache do Termux..."
        apt clean
        rm -rf /tmp/*
        npm cache clean --force 2>/dev/null
        
        echo "Limpando cache do Android..."
        adb shell pm trim-caches 1024M 2>/dev/null
        
        echo -e "${GREEN}✅ Cache limpo!${NC}"
        ;;
    2)
        echo -e "${CYAN}🗑️ Limpeza Profunda...${NC}"
        echo "Removendo pacotes desnecessários..."
        apt clean && apt autoremove -y
        
        echo "Limpando arquivos temporários..."
        rm -rf /tmp/* ~/.cache/*
        npm cache clean --force 2>/dev/null
        
        echo "Removendo Downloads antigos..."
        adb shell rm -rf /sdcard/Download/* 2>/dev/null
        
        echo "Limpando cache de apps..."
        adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null
        
        echo -e "${GREEN}✅ Limpeza profunda concluída!${NC}"
        ;;
    3)
        echo -e "${CYAN}📊 Análise de Espaço...${NC}"
        echo ""
        echo -e "${YELLOW}Espaço em Termux:${NC}"
        df -h
        echo ""
        echo -e "${YELLOW}Top 5 maiores arquivos/pastas:${NC}"
        du -sh ~/* 2>/dev/null | sort -rh | head -5
        echo ""
        echo -e "${YELLOW}Espaço no dispositivo:${NC}"
        adb shell df -h 2>/dev/null | grep "/storage"
        ;;
    4)
        echo -e "${CYAN}🚀 Limpeza Total...${NC}"
        
        echo "1/5 - Removendo pacotes..."
        apt clean && apt autoremove -y
        
        echo "2/5 - Limpando cache..."
        rm -rf /tmp/* ~/.cache/*
        npm cache clean --force 2>/dev/null
        
        echo "3/5 - Limpando Android..."
        adb shell pm trim-caches 1024M 2>/dev/null
        
        echo "4/5 - Removendo Downloads..."
        adb shell rm -rf /sdcard/Download/* 2>/dev/null
        
        echo "5/5 - Limpando cache de apps..."
        adb shell rm -rf /sdcard/Android/data/*/cache/* 2>/dev/null
        
        echo -e "${GREEN}✅ Limpeza total concluída!${NC}"
        echo ""
        echo -e "${YELLOW}Espaço liberado:${NC}"
        df -h
        ;;
    5)
        echo -e "${GREEN}👋 Até logo!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}❌ Opção inválida!${NC}"
        exit 1
        ;;
esac

echo ""
read -p "Pressione ENTER para sair..." dummy
