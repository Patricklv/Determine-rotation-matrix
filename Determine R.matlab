TarVec2 = vertcat(TarVec1(1,:)*(-1), TarVec1(2,:)*(-1), TarVec1(3,:));
TarVec3 = vertcat(TarVec1(1,:)*(-1), TarVec1(2,:), TarVec1(3,:)*(-1));
TarVec4 = vertcat(TarVec1(1,:), TarVec1(2,:)*(-1), TarVec1(3,:)*(-1)); 

% Determine the rotation matrix
R1 = TemVec*TarVec1';
R2 = TemVec*TarVec2';
R3 = TemVec*TarVec3';
R4 = TemVec*TarVec4';
Rcat = cat(4, R1, R2, R3, R4);

%{
K>> Rcat

Rcat(:,:,1,1) =

    0.0473    0.8676   -0.4950
    0.9870    0.0356    0.1567
   -0.1535    0.4960    0.8546


Rcat(:,:,1,2) =

   -0.0473   -0.8676   -0.4950
   -0.9870   -0.0356    0.1567
    0.1535   -0.4960    0.8546


Rcat(:,:,1,3) =

   -0.0473    0.8676    0.4950
   -0.9870    0.0356   -0.1567
    0.1535    0.4960   -0.8546


Rcat(:,:,1,4) =

    0.0473   -0.8676    0.4950
    0.9870   -0.0356   -0.1567
   -0.1535   -0.4960   -0.8546
%}



trR1 = trace(R1);
trR2 = trace(R2);
trR3 = trace(R3);
trR4 = trace(R4);

tr = [trR1 trR2 trR3 trR4];

%{
K>> tr

tr =

    0.9375    0.7718   -0.8664   -0.8429
%}


[trval, trid] = max(tr);

%{
K>> trval

trval =

    0.9375

K>> trid

trid =

     1
%}


R = Rcat(:, :, trid);
%{
K>> R

R =

    0.0473    0.8676   -0.4950
    0.9870    0.0356    0.1567
   -0.1535    0.4960    0.8546
%}

