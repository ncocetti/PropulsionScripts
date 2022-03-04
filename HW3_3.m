%Nick Cocetti MECH 450 Hw3 problem 3

%Knowns:
M = 0.8;  %Mach Number
T0 = 225; %K
PIc = 12; %Compression pressure ratio
To4 = 1300; %K
PIb = 0.97; %Burner stagnation pressure ratio
Cp = 1.1;  %kJ/kg*K
Mol = 29;  %avg molecular weight
gamma = 1.4; %Cp/Cv
R = 287;
u_inf = M*sqrt(gamma*R*T0);
Qr = 45000; %kJ/kg

%Efficiencies 
Nd = 0.92; %Diffuser
Nc = 0.85; %Compressor
Nt = 0.85; %Turbine 
Nn = 0.95; %Nozzle

To2 = T0*(1+((gamma-1)/2)*M^2); %Stag temp at station 2
To3 = To2*(1+(1/Nc)*((PIc^((gamma-1)/gamma)-1))); % Stag temp at station 3
To5 = To4-(To3-To2);
Tau_t = To5/To4;
%Do pressure relationships to find po6/p0 again
po5_po4 = (1-(1/Nt)*(1-(Tau_t)))^(gamma/(gamma-1));
po2_p0 = (To2/T0)^(gamma/(gamma-1));
p0_po6 = 1/(PIb*po5_po4*1*PIc*po2_p0);
ue = sqrt(2*1*(gamma/(gamma-1))*R*To5*(1-((p0_po6)^((gamma-1)/gamma))));
f = ((To4/To3)-1)/((Qr/(Cp*To3))-(To4/To3)); %fuel air ratio

specific_T = ((1+f)*ue-u_inf); %specific thrust

%Now, to find propulsive efficiency:

Npropulsion = (specific_T*u_inf*(1/((1+f)*((ue^2)/2)-(u_inf^2)/2)));

x = ['The propulsive efficiency is'];
disp(x)
disp(Npropulsion)

%Finally, thermal efficiency can be found because ma/mf = f

NTherm = f*((1+f)*((ue^2)/2)-((u_inf^2)/2))/Qr;
y = ['The thermal efficiency is approximately'];
disp(y)
disp(NTherm)
