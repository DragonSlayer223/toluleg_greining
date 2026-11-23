% Lesa beint af netinu:
url = "https://vincentarelbundock.github.io/Rdatasets/csv/vcd/SpaceShuttle.csv";
T = readtable(url);
% ... eða sækja skrána fyrst og lesa hana svo af disknum:
% websave("SpaceShuttle.csv", url);
% T = readtable("SpaceShuttle.csv");
head(T) % skoða fyrstu línurnar
T = T(:, ["Temperature","nFailures"]); % þurfum aðeins tvo dálka
T = rmmissing(T); % fjarlægja línur þar sem gögn vantar (23 eftir)
x = (T.Temperature - 32)/1.8; % lofthiti í °C (dálkvigur, 23x1)
y = T.nFailures; % fjöldi skemmdra O-hringja (dálkvigur, 23x1)
T0 = sum(y);
T1 = sum(x.*y);
S = @(k,b) sum(x.^k .* exp(b*x)); % S_k(beta_1)

%% Liður 1 byrjar hér
plot(x,y, '*') %Plottað y á móti x
xlabel('Hitastig (°C)');
ylabel('Fjöldi bilana');
title('Bilunartíðni eftir hitastigi');
grid on;

mean = mean(y); %Meðaltal 0,3913
variance = var(y); %Úrtaksdreifni 0,4308


