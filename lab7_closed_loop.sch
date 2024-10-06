v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 560 -90 560 -60 {
lab=GND}
N 560 -170 560 -150 {
lab=VDD}
N 250 -140 250 -100 {
lab=#net1}
N 250 -220 250 -200 {
lab=VDD}
N 540 -20 540 -10 {
lab=#net2}
N 440 -20 540 -20 {
lab=#net2}
N 540 50 540 70 {
lab=GND}
N -130 110 -130 130 {
lab=GND}
N -130 20 -130 50 {
lab=VICM}
N -130 20 -40 20 {
lab=VICM}
N 40 -40 190 -40 {
lab=VICM}
N 190 -50 190 -40 {
lab=VICM}
N 190 -50 200 -50 {
lab=VICM}
N 40 20 200 20 {
lab=#net3}
N 280 50 280 80 {
lab=GND}
N 310 -120 310 -80 {
lab=VDD}
N -40 -40 -40 20 {
lab=VICM}
N -40 -40 40 -40 {
lab=VICM}
N 40 20 40 160 {
lab=#net3}
N 480 -20 480 160 {
lab=#net2}
N 330 130 330 160 {
lab=probe}
N 330 50 330 70 {
lab=GND}
N 40 160 140 160 {
lab=#net3}
N 200 160 330 160 {
lab=probe}
N 330 160 400 160 {
lab=probe}
N 460 160 480 160 {
lab=#net2}
C {devices/vsource.sym} 560 -120 0 0 {name=V1 value=1.8 savecurrent=true}
C {devices/gnd.sym} 560 -60 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 560 -170 0 0 {name=l2 lab=VDD}
C {devices/capa.sym} 540 20 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} 250 -170 0 0 {name=I0 value=10u}
C {devices/vdd.sym} 250 -220 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 540 70 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -130 80 0 0 {name=V2 value="dc 1.25 ac 0" savecurrent=true}
C {devices/gnd.sym} -130 130 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -70 20 1 0 {name=p1 sig_type=std_logic lab=VICM}
C {devices/gnd.sym} 280 80 0 0 {name=l7 lab=GND}
C {devices/vdd.sym} 310 -120 0 0 {name=l8 lab=VDD}
C {OTA_5T.sym} 330 -20 0 0 {name=x9}
C {devices/code_shown.sym} 640 -460 0 0 {name=s3 only_toplevel=false value="
.include /usr/local/share/pdk/gf180mcuA/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuA/libs.tech/ngspice/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 750 -200 0 0 {name=s1 only_toplevel=false value=".options savecurrents
.control
save all
let runs=2
let run=0
alter @Vprobe1[acmag]=1
alter @iprobe1[acmag]=0
dowhile run < runs
set run =”$&run”
ac dec 20 0.01 10G
write OTA_STB_TB_\{$run\}.raw
alter @Vprobe1[acmag]=0
alter @iprobe1[acmag]=1
let run = run + 1
end
let ip22 = ac2.i(Vprobe2)
let vprb1 = ac1.probe
let mb = 1/(vprb1+ip22)-1
let phase_mb = 180/PI*vp(mb)
plot vdb(mb)
plot phase_mb
plot vdb(mb) phase_mb
echo "-------------------------------"
echo "-------------------------------"
meas ac peak MAX vmag(mb) FROM=2 TO=1.5GHZ
let f3db = peak/sqrt(2)
meas ac f1 WHEN vmag(mb)=f3db RISE=1
meas ac BW WHEN vmag(mb)=f3db FALL=1
let GBW = peak*BW
meas ac pm_deg find phase_mb when vdb(mb)=0
meas ac dominant_pole_f when vdb(mb)=0
meas ac loop_gain find vdb(mb) at=0.01
print GBW
op
show m : gm : gmbs : gds : vds : vdsat : vgs : vth : id
.endc
"}
C {devices/vsource.sym} 170 160 1 0 {name=Vprobe2 value=0 savecurrent=true}
C {devices/vsource.sym} 430 160 3 0 {name=Vprobe1 value="dc 0 ac 1" savecurrent=true}
C {devices/isource.sym} 330 100 0 0 {name=Iprobe1 value="dc 0 ac 1"}
C {devices/gnd.sym} 330 50 2 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 280 160 3 0 {name=p2 sig_type=std_logic lab=probe}
