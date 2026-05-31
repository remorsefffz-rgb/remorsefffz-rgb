# 🚀 RemorseTool - Referência de Comandos de Otimização

## 📋 System Props (setprop)

```bash
setprop debug.sf.enable_adpf_cpu_hint true
setprop debug.sf.use_phase_offsets_as_durations 1
```

**Efeito:**
- Ativa dica adaptativa de CPU para Surface Flinger
- Otimiza fases de renderização para melhor performance

---

## 🎮 GPU/OpenGL (device_config - activity_manager)

### Otimização de Display (120Hz) ⭐
```bash
cmd device_config put activity_manager ro.display.120hz.optimizer enable
cmd device_config put activity_manager ro.display.hz.optimizer enable
```

### Configurações OpenGL
```bash
cmd device_config put activity_manager GL_MAX_VARYING_VECTORS 31
cmd device_config put activity_manager GL_MAX_VERTEX_ATTRIBS 32
cmd device_config put activity_manager GL_MAX_VERTEX_OUTPUT_COMPONENTS 128
cmd device_config put activity_manager GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 16
cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_BLOCKS 14
cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_VECTORS 256
cmd device_config put activity_manager GL_MAX_VERTEX_UNIFORM_COMPONENTS 1024
cmd device_config put activity_manager GL_MAX_TEXTURE_IMAGE_UNITS 16
```

### Compute Shaders (OpenCL)
```bash
cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_HEIGHT 16384
cmd device_config put activity_manager CL_DEVICE_IMAGE2D_MAX_WIDTH 16384
cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_DEPTH 2048
cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_HEIGHT 16384
cmd device_config put activity_manager CL_DEVICE_IMAGE3D_MAX_WIDTH 16384
cmd device_config put activity_manager CL_DEVICE_LOCAL_MEM_SIZE 32768
```

**Efeito:**
- 🎮 Display otimizado para 120Hz
- Melhora renderização de gráficos
- Otimiza processamento de compute shaders
- Aumenta suporte a texturas e operações GPU

---

## ⚡ Input/Latência (device_config - input_native_boot)

```bash
cmd device_config put input_native_boot enable_input_latency_optimization true
cmd device_config put input_native_boot input_event_timeout_ms 4
cmd device_config put input_native_boot enable_motion_prediction true
cmd device_config put input_native_boot motion_prediction_offset_ms 1
cmd device_config put input_native_boot resample_touch true
cmd device_config put input_native_boot touch_resample_rate 1
cmd device_config put input_native_boot max_events_per_second 240
cmd device_config put input_native_boot enable_touch_resampling true
cmd device_config put input_native_boot touch_slop 1
```

**Efeito:**
- ⚡ Reduz latência de entrada significativamente
- 👆 Melhora resposta do toque (240 FPS!)
- 🎯 Ativa predição de movimento
- 📍 Reduz "slop" para toque mais preciso
- 🔄 Reamostragem de toque para suavidade

---

## ⏱️ Touch Timeouts (Settings) ⭐

```bash
settings put secure long_press_timeout 100
settings put secure multi_press_timeout 10
```

**Efeito:**
- 🕐 `long_press_timeout 100` - Pressionamento longo em 100ms
- 🕐 `multi_press_timeout 10` - Multi-toque rápido em 10ms
- ⚡ Melhora significativa de responsividade
- 👆 Toque muito mais rápido e preciso

---

## 🧹 Limpeza Termux

```bash
apt clean                              # Remove cache de pacotes
apt autoremove -y                      # Remove pacotes não utilizados
rm -rf /tmp/*                          # Limpa arquivos temporários
npm cache clean --force                # Limpa cache npm
```

---

## 🔌 Comandos ADB Complementares

```bash
# Verificar conexão
adb devices

# Limpar cache do sistema
adb shell pm trim-caches 1024M

# Remover Downloads
adb shell rm -rf /sdcard/Download/*

# Limpar cache de apps
adb shell rm -rf /sdcard/Android/data/*/cache/*

# Ver status da bateria
adb shell dumpsys battery

# Ver espaço em disco
adb shell df -h
```

---

## 📱 Como Aplicar Manualmente

### Via ADB (Termux)
```bash
# 1. Verificar conexão
adb devices

# 2. Aplicar uma prop
adb shell setprop debug.sf.enable_adpf_cpu_hint true

# 3. Ou aplicar um device_config
adb shell cmd device_config put activity_manager ro.display.120hz.optimizer enable

# 4. Ou ajustar settings
adb shell settings put secure long_press_timeout 100
adb shell settings put secure multi_press_timeout 10
```

### Via RemorseTool
```bash
# Modo interativo
./RemorseTool.sh

# Modo automático
./RemorseTool.sh --auto
```

### Via Script Simples
```bash
./otimizar-simples.sh
```

---

## ✨ Resumo de Melhorias

| Categoria | Melhoria |
|-----------|----------|
| 🎮 GPU | Renderização mais suave (120Hz) |
| ⚡ Input | Latência reduzida |
| 👆 Toque | Mais responsivo e preciso |
| ⏱️ Long Press | Detecção em 100ms |
| ⏱️ Multi Press | Detecção em 10ms |
| 🎯 Display | 120Hz otimizado |
| 💫 Gráficos | Mais fluido e detalhado |
| 🔋 Bateria | Melhor gerenciamento |

---

## 🎯 Recomendações

✅ **Aplicar todas as props para máxima performance**
✅ **Reiniciar o dispositivo após aplicar**
✅ **Usar RemorseTool.sh para aplicação fácil**
✅ **Executar limpeza regularmente**

---

**Criado com ❤️ por remorsefffz-rgb**
