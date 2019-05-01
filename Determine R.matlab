TarVec2 = horzcat(TarVec1(:, 1)*(-1), TarVec1(:, 2)*(-1), TarVec1(:, 3));
TarVec3 = horzcat(TarVec1(:, 1)*(-1), TarVec1(:, 2), TarVec1(:, 3)*(-1));
TarVec4 = horzcat(TarVec1(:, 1), TarVec1(:, 2)*(-1), TarVec1(:, 3)*(-1));

% Determine the rotation matrix
R1 = TemVec*TarVec1';
R2 = TemVec*TarVec2';
R3 = TemVec*TarVec3';
R4 = TemVec*TarVec4';
Rcat = cat(4, R1, R2, R3, R4);

%{
Rcat
val(:,:,1,1) =

    0.0473    0.8676   -0.4950
    0.9870    0.0356    0.1567
   -0.1535    0.4960    0.8546


val(:,:,1,2) =

   -0.0527   -0.8853    0.4620
   -0.9041    0.2387    0.3543
    0.4240    0.3991    0.8130


val(:,:,1,3) =

    0.0313    0.8875   -0.4598
   -0.9874   -0.0439   -0.1521
    0.1552   -0.4587   -0.8749


val(:,:,1,4) =

   -0.0260   -0.8698    0.4927
    0.9045   -0.2303   -0.3589
   -0.4257   -0.4364   -0.7927
%}



trR1 = trace(R1);
trR2 = trace(R2);
trR3 = trace(R3);
trR4 = trace(R4);

tr = [trR1 trR2 trR3 trR4];

%{
K>> tr

tr =

    0.9375    0.9990   -0.8875   -1.0491
%}


[trval, trid] = max(tr);

%{
K>> trval

trval =

    0.9990

K>> trid

trid =

     2
%}


R = Rcat(:, :, trid);
%{
K>> R

R =

   -0.0527   -0.8853    0.4620
   -0.9041    0.2387    0.3543
    0.4240    0.3991    0.8130
%}

