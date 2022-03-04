%Nick Cocetti MECH 450 Hw 3 Question 2

%Establish Variables
M = 2;      %Mach Number
T0 = 200;   %K
gamma = 1.4;%Ratio of specific heats
Cp = 1;  %constant P specific heat
PIc = 9;    %compressor ration
Nc = 0.95;  %Compressor efficiency
Nt = 0.9;   %Turbine efficiency
PIb = 1;     %Burner Pressure Ratio
Qr = 45000; %Heating Value
R = 287;     %J/kg
To4_1 = 1200; %K
To4_2 = 1600; %K

%Establish Equations for unknowns

To2 = T0*(1+((gamma-1)/2)*M^2); %Stag temp at station 2
To3 = To2*(1+(1/Nc)*((PIc^((gamma-1)/gamma)-1))); % Stag temp at station 3
To5 = To4_1-(To3-To2);
u = M*sqrt(gamma*R*T0);

Tau_t = To5/To4_1; %Stagnation Temp Ratio across the turbine
po5_po4 = (1-(1/Nt)*(1-(Tau_t)))^(gamma/(gamma-1));
po2_p0 = (To2/T0)^(gamma/(gamma-1));
p0_po6 = 1/(PIb*po5_po4*1*PIc*po2_p0);
ue = sqrt(2*1*(gamma/(gamma-1))*R*To5*(1-((p0_po6)^((gamma-1)/gamma)))); %eqn 5.45

f = ((To4_1/To3)-1)/((Qr/(Cp*To3))-(To4_1/To3)); %eqn 5.41

specific_T_1 = ((1+f)*ue-u); %specific thrust for the 1200 K condition. Eqn 5.35

%Now using the new To4 

To5_2 = To4_2-(To3-To2); %Eqn 5.44

Tau_t_2 = To5_2/To4_1; %Stagnation Temp Ratio across the turbine

ue_2 = sqrt(2*1*(gamma/(gamma-1))*R*To5_2*(1-((p0_po6)^((gamma-1)/gamma))));

f_2 = ((To4_2/To3)-1)/((Qr/(Cp*To3))-(To4_2/To3));

specific_T_2 = ((1+f)*ue_2-u); %specific thrust for the 1200 K condition
y = ['The specific thrust for scenario one is'];
disp(y)
disp(specific_T_1)
z = ['The specific thrust for scenario two is'];
disp (z)
disp(specific_T_2)

%part B...

TSFC_1 = f/(specific_T_1);
TSFC_2 = f/(specific_T_2);

%Ratio of the second to first TSFC

ratio = TSFC_2/TSFC_1;
x = ['The ratios of TSFC is', ratio];
disp(x)
disp(ratio)
