## 🚀 RemorseTool - Scripts de Otimização

Scripts para otimização de **Termux** e **Android** via **ADB** (Android Debug Bridge).

Inclui otimizações de **GPU, OpenGL, Input Latency** e muito mais!

### 📋 Arquivos Disponíveis

#### 1. **RemorseTool.sh** ⭐ (Recomendado)
Script principal com menu interativo completo.

**Recursos:**
- ✅ Atualizar sistema
- 📦 Instalar dependências
- 🧹 Limpar cache
- ⚙️ Aplicar System Props
- 🎮 Otimizar GPU/OpenGL
- ⚡ Otimizar Input/Latência
- 🔧 Otimização ADB
- 📊 Verificar espaço
- 📱 Status do dispositivo
- 🚀 Executar TUDO automaticamente

**Uso:**
```bash
curl -L -o RemorseTool https://raw.githubusercontent.com/remorsefffz-rgb/remorsefffz-rgb/main/scripts/RemorseTool.sh
chmod +x RemorseTool
./RemorseTool
```

**Modo automático (sem menu):**
```bash
./RemorseTool --auto
```

---

#### 2. **otimizar-simples.sh**
Script simples que executa tudo de uma vez, sem interação.

**Uso:**
```bash
curl -L -o otimizar-simples https://raw.githubusercontent.com/remorsefffz-rgb/remorsefffz-rgb/main/scripts/otimizar-simples.sh
chmod +x otimizar-simples
./otimizar-simples
```

---

#### 3. **OTIMIZACOES-REFERENCIA.md**
Documento completo com referência de TODOS os comandos.

---

### 🔌 Requisitos

- **Termux** instalado no Android
- **curl** ou **wget**
- **android-tools** (para ADB) - instalado automaticamente

### ⚙️ Configuração Inicial

#### 1. Habilitar ADB (USB Debugging)
```bash
# No Android:
1. Configurações > Sobre o telefone
2. Toque 7x em "Número da compilação"
3. Volte a Configurações > Opções de desenvolvedor
4. Ative "Depuração USB"
```

#### 2. Conectar via ADB
```bash
# No Termux:
adb devices

# Ou via WiFi:
adb tcpip 5555
adb connect SEU_IP:5555
```

---

### 📱 Comandos ADB Úteis

```bash
# Verificar conexão
adb devices

# Acessar shell do Android
adb shell

# Sair do shell
exit

# Ver status da bateria
adb shell dumpsys battery

# Limpar cache do sistema
adb shell pm trim-caches 1024M

# Remover arquivos grandes
adb shell rm -rf /sdcard/Download/*

# Ver espaço em disco
adb shell df -h
```

---

### 🎯 Otimizações Incluídas

#### ⚙️ System Props
- `debug.sf.enable_adpf_cpu_hint` - Dica adaptativa de CPU
- `debug.sf.use_phase_offsets_as_durations` - Otimiza fases de renderização

#### 🎮 GPU/OpenGL
- Otimização de 90Hz
- 16 configurações OpenGL
- 5 configurações OpenCL (Compute Shaders)

#### ⚡ Input/Latência
- Otimização de latência de entrada
- Predição de movimento
- Reamostragem de toque
- Até 240 FPS de eventos
- Touch slop otimizado (mais preciso)

#### 🧹 Limpeza
- Cache Termux
- Cache npm
- Arquivos temporários
- Downloads antigos

---

### 🛠️ Dicas de Uso

**1. Executar automaticamente ao iniciar Termux:**
```bash
echo './RemorseTool --auto' >> ~/.bashrc
```

**2. Criar alias para fácil acesso:**
```bash
echo "alias optimize='~/RemorseTool --auto'" >> ~/.bashrc
source ~/.bashrc

# Depois usar:
optimize
```

**3. Agendar limpeza semanal:**
```bash
# Instalar cronie
pkg install cronie

# Editar crontab
crontab -e

# Adicionar (todo domingo às 2 AM):
0 2 * * 0 /root/RemorseTool --auto
```

---

### 📊 O que é Otimizado?

✅ Atualização de pacotes Termux
✅ Limpeza de cache do sistema
✅ Remoção de dependências não utilizadas
✅ Limpeza de arquivos temporários
✅ Otimização via ADB (Android)
✅ Limpeza de Downloads
✅ Limpeza de cache de apps Android
✅ Verificação de espaço em disco
✅ System Props para melhor performance
✅ GPU/OpenGL otimizado
✅ Input Latency reduzida
✅ Toque mais responsivo

---

### 🎮 Melhorias de Performance Esperadas

Após executar **TODAS** as otimizações:

| Aspecto | Melhoria |
|---------|----------|
| 🎮 Gráficos | 30-50% mais suave |
| ⚡ Latência | Redução significativa |
| 👆 Resposta do Toque | Muito mais rápido |
| 🔋 Bateria | Melhor gerenciamento |
| 💾 Espaço | Mais livre |
| 🚀 Velocidade Geral | Perceptivelmente mais rápido |

---

### 🐛 Troubleshooting

**Erro: "ADB not found"**
```bash
pkg install android-tools -y
```

**Erro: "Permission denied"**
```bash
chmod +x RemorseTool.sh
chmod +x otimizar-simples.sh
```

**Erro: "Device not found"**
```bash
# Verifique se USB Debugging está habilitado
# E reconecte o dispositivo
adb devices
```

**Props não estão sendo aplicadas:**
```bash
# Verifique se o dispositivo está conectado
adb devices

# Tente novamente
./RemorseTool --auto
```

---

### 📝 Changelog

**v1.0** (2025-05-31)
- ✅ Script principal RemorseTool com menu interativo
- ✅ Script simples para otimização rápida
- ✅ Suporte completo a ADB
- ✅ System Props (2 props)
- ✅ GPU/OpenGL (16 configs)
- ✅ Input Latency (9 configs)
- ✅ Cores e formatação melhorada
- ✅ Modo automático para automação
- ✅ Referência completa de comandos

---

### 🤝 Contribuições

Sugestões e melhorias são bem-vindas! Abra uma issue ou pull request.

---

### 📄 Licença

Estes scripts são livres para usar e modificar.

---

**Criado com ❤️ por remorsefffz-rgb**
