#!/bin/sh
case $1 in
    "q")
        echo "Merge qcacld"
        git fetch qcacld LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/qcacld-3.0 FETCH_HEAD
        ;;
    "w")
        echo "Merge qca-wifi-host-cmn"
        git fetch qca-wifi-host-cmn LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/qca-wifi-host-cmn FETCH_HEAD
        ;;
    "f")
        echo "Merge fw-api"
        git fetch fw-api LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/fw-api FETCH_HEAD
        ;;
    "a")
        echo "Merge qcacld"
        git fetch qcacld LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/qcacld-3.0 FETCH_HEAD
        echo "Merge qca-wifi-host-cmn"
        git fetch qca-wifi-host-cmn LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/qca-wifi-host-cmn FETCH_HEAD
        echo "Merge fw-api"
        git fetch fw-api LA.UM.8.1.r1-$2-sm8150.0
        git merge -X subtree=drivers/staging/fw-api FETCH_HEAD
        ;;
    *)
    echo "Add remote"
    git remote add fw-api https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/fw-api
    git remote add qca-wifi-host-cmn https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn
    git remote add qcacld https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0
    ;;
esac