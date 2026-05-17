#!/bin/bash

ROOT_DIR=$PWD
PATCH_DIR=$ROOT_DIR/device/xiaomi/merlinx/patches

# Navegar a frameworks/av
cd $ROOT_DIR/frameworks/av

# git apply --check devuelve 0 si el parche se puede aplicar limpiamente (es decir, aún no está aplicado)
if git apply --check $PATCH_DIR/frameworks/av/0001-stagefright.patch &>/dev/null; then
    echo "[merlinx-patches] Aplicando parche en frameworks/av..."
    git apply $PATCH_DIR/frameworks/av/0001-stagefright.patch
else
    # Si ya está aplicado o hay conflictos, no hace nada
    echo "[merlinx-patches] El parche en frameworks/av ya está aplicado o tiene cambios locales. Omitiendo."
fi

# Volver a la raíz del árbol
cd $ROOT_DIR
