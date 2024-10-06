v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -540 -1040 260 -640 {flags=graph
y1=1e-35
y2=11000000
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=gbw
color=4
dataset=-1
unitx=1
logx=0
logy=0
sweep=vicmact
sim_type=ac


x1=0.6
x2=3.6}
N 240 -100 240 -70 {
lab=GND}
N 240 -180 240 -160 {
lab=VDD}
N -70 -150 -70 -110 {
lab=#net1}
N -70 -230 -70 -210 {
lab=VDD}
N 220 -30 220 -20 {
lab=Avd}
N 120 -30 220 -30 {
lab=Avd}
N 220 40 220 60 {
lab=GND}
N -450 100 -450 120 {
lab=GND}
N -450 10 -450 40 {
lab=VICM}
N -450 10 -360 10 {
lab=VICM}
N -610 0 -610 30 {
lab=GND}
N -610 -60 -370 -60 {
lab=VID}
N -370 -60 -370 -50 {
lab=VID}
N -370 -50 -360 -50 {
lab=VID}
N -280 -50 -130 -50 {
lab=#net2}
N -130 -60 -130 -50 {
lab=#net2}
N -130 -60 -120 -60 {
lab=#net2}
N -280 10 -120 10 {
lab=#net3}
N -40 40 -40 70 {
lab=GND}
N -10 -130 -10 -90 {
lab=VDD}
N -30 280 -30 320 {
lab=#net4}
N -30 200 -30 220 {
lab=VDD}
N 260 400 260 410 {
lab=Avd2}
N 160 400 260 400 {
lab=Avd2}
N 260 470 260 490 {
lab=GND}
N -410 530 -410 550 {
lab=GND}
N -410 440 -410 470 {
lab=VICM2}
N -410 440 -320 440 {
lab=VICM2}
N -570 430 -570 460 {
lab=GND}
N -570 370 -330 370 {
lab=VID2}
N -330 370 -330 380 {
lab=VID2}
N -330 380 -320 380 {
lab=VID2}
N -240 380 -90 380 {
lab=#net5}
N -90 370 -90 380 {
lab=#net5}
N -90 370 -80 370 {
lab=#net5}
N -240 440 -80 440 {
lab=#net6}
N 0 470 0 500 {
lab=GND}
N 30 300 30 340 {
lab=VDD}
C {devices/vsource.sym} 240 -130 0 0 {name=V1 value=1.8 savecurrent=true}
C {devices/gnd.sym} 240 -70 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 240 -180 0 0 {name=l2 lab=VDD}
C {devices/capa.sym} 220 10 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} -70 -180 0 0 {name=I0 value=10u}
C {devices/vdd.sym} -70 -230 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 220 60 0 0 {name=l4 lab=GND}
C {balun.sym} -320 -20 0 0 {name=balun1}
C {devices/vsource.sym} -450 70 0 0 {name=VICM value="dc 1.25 ac 0" savecurrent=true}
C {devices/vsource.sym} -610 -30 0 0 {name=V3 value="dc 0 ac 1" savecurrent=true}
C {devices/gnd.sym} -450 120 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -610 30 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -390 10 1 0 {name=p1 sig_type=std_logic lab=VICM}
C {devices/lab_pin.sym} -420 -60 1 0 {name=p2 sig_type=std_logic lab=VID}
C {devices/gnd.sym} -40 70 0 0 {name=l7 lab=GND}
C {devices/vdd.sym} -10 -130 0 0 {name=l8 lab=VDD}
C {devices/code_shown.sym} 520 -280 0 0 {name=s1 only_toplevel=false value=".control
let Vstart=0
let Vstop=1.8
let Vstep=10m
let Vact=Vstart
let VICMmax=0
let VICMmin =0
let gbwmin = 0
save all
ac dec 10 1 100G
let vx = Avd
meas ac DiffGain MAX vmag(vx) FROM=1 TO=10G
let ff1=DiffGain*0.707
meas ac f3db WHEN vmag(vx) = ff1 FALL =1
let GBWmin = 0.9*DiffGain*f3db
save gbwmin
while Vact le Vstop
alter VICM Vact
ac dec 10 1 100G
let vx = Avd
meas ac DiffGain MAX vmag(vx) FROM=1 TO=100MEG
let ff1=DiffGain*0.707
meas ac f3db WHEN vmag(vx) = ff1 FALL =1
let GBW = DiffGain*f3db
save GBW
let vx = Vact
let VICMact = Vact + VICM
save VICMact
set appendwrite
remzerovec
write OTA.raw
if (GBW > GBWmin)
let VICMmax = Vact
endif
if (GBW < GBWmin)
if (Vact<1)
let VICMmin = Vact
endif
endif
let Vact=Vact+Vstep
end
print VICMmax
print VICMmin
plot GBW
.endc
"}
C {devices/code_shown.sym} 260 -430 0 0 {name=s3 only_toplevel=false value="
.include /usr/local/share/pdk/gf180mcuA/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/pdk/gf180mcuA/libs.tech/ngspice/sm141064.ngspice typical
"}
C {OTA_5T.sym} 10 -30 0 0 {name=x9}
C {devices/lab_pin.sym} 180 -30 1 0 {name=p4 sig_type=std_logic lab=Avd}
C {devices/launcher.sym} -240 -560 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/OTA.raw ac"
}
C {devices/capa.sym} 260 440 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} -30 250 0 0 {name=I1 value=10u}
C {devices/vdd.sym} -30 200 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 260 490 0 0 {name=l12 lab=GND}
C {balun.sym} -280 410 0 0 {name=balun2}
C {devices/vsource.sym} -410 500 0 0 {name=VICM1 value="dc 1.25 ac 1" savecurrent=true}
C {devices/vsource.sym} -570 400 0 0 {name=V4 value="dc 0 ac 0" savecurrent=true}
C {devices/gnd.sym} -410 550 0 0 {name=l13 lab=GND}
C {devices/gnd.sym} -570 460 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} -350 440 1 0 {name=p3 sig_type=std_logic lab=VICM2}
C {devices/lab_pin.sym} -380 370 1 0 {name=p5 sig_type=std_logic lab=VID2}
C {devices/gnd.sym} 0 500 0 0 {name=l15 lab=GND}
C {devices/vdd.sym} 30 300 0 0 {name=l16 lab=VDD}
C {OTA_5T.sym} 50 400 0 0 {name=x1}
C {devices/lab_pin.sym} 220 400 1 0 {name=p6 sig_type=std_logic lab=Avd2}
