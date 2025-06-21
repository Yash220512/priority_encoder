simSetSimulator "-vcssv" -exec "/home/student/RTL2GDSII/rtl_simulation/simv" \
           -args "Verdi"
debImport "-dbdir" "/home/student/RTL2GDSII/rtl_simulation/simv.daidir"
debLoadSimResult /home/student/RTL2GDSII/rtl_simulation/novas.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "233" "27" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 9 2 6 1 1}
wvAddSignal -win $_nWave2 "/pri_enc_tb/Clock" "/pri_enc_tb/d\[3:0\]" \
           "/pri_enc_tb/q\[1:0\]" "/pri_enc_tb/v"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
schCreateWindow -delim "." -win $_nSchema1 -scope "pri_enc_tb"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "uut"
schPushViewIn -win $_nSchema3
debExit
