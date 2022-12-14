%Σήματα και συστήματα 2020-2021
%Μέλη ομάδας: Π19183, Π19040, Π19092
%Εργασία 1 (Άσκηση Γ3).

%Ερώτημα 3
fs = 8000;
t=0:1/fs:0.5;
%πολλαπλασιάζουμε κάθε νότα με τη συνάρτηση f(t)=0.5-t που μειώνεται όσο
%αυξάνεται το t

A = make_note(0,fs,0.5,1).*(0.5-t);
Bb = make_note(1,fs,0.5,1).*(0.5-t);
B = make_note(2,fs,0.5,1).*(0.5-t);
C = make_note(3,fs,0.5,1).*(0.5-t);
Db = make_note(4,fs,0.5,1).*(0.5-t);
D = make_note(5,fs,0.5,1).*(0.5-t);
Eb = make_note(6,fs,0.5,1).*(0.5-t);
E = make_note(7,fs,0.5,1).*(0.5-t);
F = make_note(8,fs,0.5,1).*(0.5-t);
Gb = make_note(9,fs,0.5,1).*(0.5-t);
G = make_note(10,fs,0.5,1).*(0.5-t);
Ab = make_note(11,fs,0.5,1).*(0.5-t);
pause = zeros(1,0.35*fs); %Μικρή πάυση (διάνυσμα μηδενικών)
pause_small = zeros(1,0.2*fs);  %Πιο μικρή πάυση
pause_tiny = zeros(1,0.05*fs);  %Ακόμα πιο μικρή πάυση

% Νότες που διαρκούν 0.25s. Τις πολλαπλασιάζουμε με συνάρτηση που μειώνεται
% όσο αυξάνεται το t2.
t2 = 0:1/fs:0.25;
% Αλλάζουμε τη συνάρτηση λίγο για να μειώνεται όμοια με τις νότες που
% διαρκούν 0.5s.
D_fast = make_note(5,fs,0.25,1).*(0.5-(2*t2));
C_fast = make_note(3,fs,0.25,1).*(0.5-(2*t2));
E_fast = make_note(7,fs,0.25,1).*(0.5-(2*t2));
F_fast = make_note(8,fs,0.25,1).*(0.5-(2*t2));

%Notes for Beethoven's "Ode to Joy"
notes1 = [E E F G G F E D C C D E E pause D_fast D];
notes2 = [pause_small E E F G G F E D C C D E D pause C_fast C];
notes3 = [pause_small D D E C D E_fast F_fast E pause_tiny C];
notes4 = [D E_fast F_fast E pause_tiny D C D pause_tiny G];
notes5 = [pause_small E E F G G F E D C C D E D pause C_fast C];
notes = [notes1 notes2 notes3 notes4 notes5];

sound(notes,fs);    %Παίξε τον ήχο