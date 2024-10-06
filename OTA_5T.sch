v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -240 60 -10 60 {
lab=IBN}
N -280 -40 -280 30 {
lab=IBN}
N -280 10 -220 10 {
lab=IBN}
N -220 10 -220 60 {
lab=IBN}
N -300 60 -280 60 {
lab=GND}
N -300 60 -300 100 {
lab=GND}
N -300 100 -280 100 {
lab=GND}
N -280 90 -280 100 {
lab=GND}
N -280 90 -280 100 {
lab=GND}
N -280 100 -280 130 {
lab=GND}
N -280 130 30 130 {
lab=GND}
N 30 90 30 130 {
lab=GND}
N 30 60 80 60 {
lab=GND}
N 80 60 80 110 {
lab=GND}
N 30 110 80 110 {
lab=GND}
N 30 -10 30 30 {
lab=#net1}
N -60 -10 30 -10 {
lab=#net1}
N -60 -20 -60 -10 {
lab=#net1}
N 30 -10 140 -10 {
lab=#net1}
N 120 -50 140 -50 {
lab=GND}
N 60 -50 120 -50 {
lab=GND}
N -60 -50 60 -50 {
lab=GND}
N -60 -190 -60 -80 {
lab=#net2}
N -20 -220 110 -220 {
lab=#net2}
N -0 -220 -0 -180 {
lab=#net2}
N -60 -180 -0 -180 {
lab=#net2}
N -90 -220 -60 -220 {
lab=VDD}
N -90 -250 -90 -220 {
lab=VDD}
N -90 -250 -60 -250 {
lab=VDD}
N 150 -220 170 -220 {
lab=VDD}
N 170 -250 170 -220 {
lab=VDD}
N 150 -250 170 -250 {
lab=VDD}
N -60 -290 -60 -250 {
lab=VDD}
N -60 -290 150 -290 {
lab=VDD}
N 150 -290 150 -250 {
lab=VDD}
N 150 -190 150 -90 {
lab=VOUT}
N 150 -90 150 -80 {
lab=VOUT}
N 140 -50 150 -50 {
lab=GND}
N 150 -20 150 -10 {
lab=#net1}
N 140 -10 150 -10 {
lab=#net1}
N 190 -50 230 -50 {
lab=VIN-}
N -160 -50 -100 -50 {
lab=VIN+}
N 80 -50 80 60 {
lab=GND}
C {symbols/nfet_03v3.sym} -80 -50 0 0 {name=M1
L=450n
W=22.27u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 170 -50 0 1 {name=M2
L=450n
W=22.27u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -260 60 0 1 {name=M4
L=2.7u
W=18.15u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 130 -220 0 0 {name=M5
L=300n
W=5.84u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -40 -220 0 1 {name=M6
L=300n
W=5.84u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/iopin.sym} 30 -290 3 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 30 130 1 0 {name=p2 lab=GND}
C {devices/iopin.sym} 220 -50 0 0 {name=p3 lab=VIN-}
C {devices/iopin.sym} -160 -50 2 0 {name=p4 lab=VIN+}
C {devices/iopin.sym} 150 -140 0 0 {name=p5 lab=VOUT}
C {devices/iopin.sym} -280 -40 3 0 {name=p6 lab=IBN}
C {symbols/nfet_03v3.sym} 10 60 0 0 {name=M3
L=2.7u
W=72.6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
