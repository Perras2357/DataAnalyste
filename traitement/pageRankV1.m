%% Importation du fichier txt

%Repertoire où se trouve les fichiers
data_dir = "../data/";
d = 0.85; % Damping google

%Recherche des fichiers ayant pour extension .txt
pattern = fullfile(data_dir,"*.txt");
listeStruct = dir(pattern);

%Extraction du nom des fichiers
files = {listeStruct.name};
N = length(files);

if N == 0
  error('Aucun fichier .txt trouvé dans le repertoire : %s', data_dir);
end

%fprintf('%d fichiers trouvés pour traitement.\n', N);

% Initialisation du dictionnaire
indexMap = struct();

for i = 1:N
    % Nom du fichier (ex: "file1.txt")
    fname = files{i};

    % Normalisation pour en faire un champ valide
    % "file1.txt" -> "file1_txt"
    key = strrep(fname, '.txt', '');

    % Stockage de la correspondance
    indexMap.(key) = i;
end

% structure de tableaux variant
outLinks = cell(N,1);

%on construit le dictionnaire fichier1(pointeur) -> fichier2(pointé)
for i = 1:N

    %on charge tous les fichiers d'un repertoire
    contenu = fileread(fullfile(data_dir, files{i}));

     %on récupère les noms des fichiers pointés
    raw = regexp(contenu, '\[pointeur\]\(([^)]+)\)', 'tokens');
    if isempty(raw)
        outLinks{i} = [];
        continue;
    end

    targets = [raw{:}];             %liste des fichiers pointés
    idx = [];

    %on parcours le contenu de la liste de fichiers
    for k = 1:numel(targets)
        t = strtrim(targets{k});  % on enlève espaces

        % on vérifie si chaque fichier pointé existe dans le tableau d'indexation
        if isfield(indexMap, t)
            idx(end+1) = indexMap.(t); %#ok<AGROW>
        end
    end

    outLinks{i} = unique(idx);    %on ne considère pas deux fois le même fichier pointé
end

outLinks

