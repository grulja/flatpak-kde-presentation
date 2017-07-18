#!/bin/sh

echo ========== Building $APPID ================
flatpak-builder --force-clean --ccache --require-changes --repo=repo --subject="Nightly build of ${APPID}, `date`" ${EXPORT_ARGS-} app org.kde.flatpak-kde.json

flatpak build-update-repo --generate-static-deltas --prune --prune-depth=8  ${EXPORT_ARGS-} repo
