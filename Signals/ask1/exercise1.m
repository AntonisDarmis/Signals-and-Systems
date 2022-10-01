%Σήματα και συστήματα 2020-2021
%Μέλη ομάδας: Π19183, Π19040, Π19092
%Εργασία 1 (Άσκηση Γ1).

%Για καλύτερη σύγκριση των γραφημάτων των σημάτων, συμβουλευτείται το pdf.

% 1)
%Το δοσμένο σήμα είναι το σήμα x(t)=cos100πt+cos200πt+sin500πt
%Οι συχνότητες του σήματος είναι:
%ω1=100π rad/s, ω2=200π rad/s, ω3=500π rad/s
%Διαιρούμε με 2π για να μετατρέψουμε τις κυκλικές συχνότητες 
%σε συχνότητες f1, f2, f3
%f1=100π/2π=50Hz, f2=200π/2π=100Hz, f3=500π/2π=250Hz
%Άρα η μέγιστη συχνότητα fmax από τις παραπάνω είναι η f3=250Hz.
%Σύμφωνα με το θεώρημα δειγματοληψίας, η ελάχιστη συχνότητα
%δειγματοληψίας είναι 2*fmax αφού Fs >= 2*fmax
%άρα Fs>=2*250=500Hz --> Ts = 1/Fs = 1/500 = 0.002s

% 2)
%αρχικό σήμα
dt=0.001;
t_max=10;
t = -t_max:dt:t_max;
x = cos(100*pi*t) + cos(200*pi*t) + sin(500*pi*t);
figure('Name','Original Signal Representation');
plot(t,x,'-r','LineWidth',1.3);
xlabel('-10 \leq t \leq +10');
xlim([-0.1 0.1]);
ylabel('x(t)');
grid on

% 3)
%Χρησιμοποιούμε τον τύπο ανακατασκευής με Ts=0.002s (Fs=500Hz)
%x(t_max)=x(Nmax*Ts) --> Nmax = t_max/Ts
Ts = 0.002;
Nmax = t_max / Ts;
n3 = -Nmax:1:Nmax;
xs = cos(100*pi*n3*Ts) + cos(200*pi*n3*Ts) + sin(500*pi*n3*Ts);
% Αρχικοποίηση διανύσματος για αποθήκευση των τιμών του ανακατασκευασμένου
% σήματος
x3 = zeros(1,length(t));
% Δημιουργούμε τις τιμές του ανακατασκευασμένου σήματος για κάθε χρονική
% στιγμή μέσα στο αρχικό χρονικό διάστημα
for k = 1:1:length(t)
    x3(k) = xs * sinc((t(k)-n3*Ts)/Ts)';
end
% Το αρχικό και το ανακατασκευασμένο σήμα μαζί.
figure('Name','Reconstructed Signal for Ts = 0.002');
hold on
plot(t,x,'-r','LineWidth',1.5);
plot(t,x3,'-b','LineWidth',1.2);
xlabel('-10 \leq t \leq +10');
xlim([-0.1 0.1]);
ylabel('x(t) ans x3(t)');
grid on

% 4)
% Χρησιμοποιούμε περίοδο δειγματοληψίας Ts = 0.001s που είναι μικρότερη
% από την μέγιστη περίοδο δειγματοληψίας με βάση το θεώρημα του Nyquist
% (άρα η συχνότητα είναι μεγαλύτερη)
% (Ts = 0.002s, βρέθηκε στο πρώτο ερώτημα).
Ts = 0.001;
Nmax = t_max / Ts;
n4 = -Nmax:1:Nmax;
% Δημιουργία διανύσματος με δείγματα του αρχικού σήματος
xs = cos(100*pi*n4*Ts) + cos(200*pi*n4*Ts) + sin(500*pi*n4*Ts);
% Αρχικοποίηση διανύσματος για αποθήκευση των τιμών του ανακατασκευασμένου
% σήματος
x4 = zeros(1,length(t));
% Δημιουργούμε τις τιμές του ανακατασκευασμένου σήματος για κάθε χρονική
% στιγμή μέσα στο αρχικό χρονικό διάστημα
for k = 1:1:length(t)
    x4(k) = xs * sinc((t(k)-n4*Ts)/Ts)';
end
% Το νέο σχήμα μαζί με τα προηγούμενα.
figure('Name','Reconstructed Signal for Ts = 0.001');
hold on
plot(t,x,'-r','LineWidth',1.5);
plot(t,x3,'-b','LineWidth',1.2);
plot(t,x4,'-k','LineWidth',1.2);
xlabel('-10 \leq t \leq +10');
xlim([-0.1 0.1]);
ylabel('x(t) ans x4(t)');
grid on

% 5)
% Χρησιμοποιούμε συχνότητα δειγματοληψίας Ts = 0.01s που είναι μεγαλύτερη
% από την μέγιστη περίοδο δειγματοληψίας με βάση το θεώρημα του Nyquist 
% (Ts = 0.002s, βρέθηκε στο πρώτο ερώτημα). 
% (άρα η συχνότητα είναι μεγαλύτερη)
Ts = 0.01;
Nmax = t_max/Ts;
n5 = -Nmax:1:Nmax;
xs = cos(100*pi*n5*Ts) + cos(200*pi*n5*Ts) + sin(500*pi*n5*Ts);
x5 = zeros(1,length(t));
for k = 1:1:length(t)
    x5(k) = xs * sinc((t(k)-n5*Ts)/Ts)';
end
figure('Name','Reconstructed Signal for Ts = 0.01');
hold on
plot(t,x,'-r','LineWidth',1.5);
plot(t,x3,'-b','LineWidth',1.2);    %*
plot(t,x4,'-k','LineWidth',1.2);    %o
plot(t,x5,'-y','LineWidth',1.2);    %s
xlabel('-10 \leq t \leq +10');
xlim([-0.1 0.1]);
ylabel('x(t) ans x5(t)');
grid on
