%% main.m - Point d'entrée
%clear; clc;

data_dir = fullfile(pwd, 'data'); % dossier data/ au même niveau que main.m
d = 0.85;

% 1) Charger les fichiers
[files, contents] = chargerFichiers(data_dir);

% 2) Construire outLinks + indexMap
[outLinks, indexMap] = construireOutLinks(files, contents);


% 3) Matrice de transition
M = construireMatriceTransition(outLinks, numel(files));

% 4) Matrice Google
G = construireMatriceGoogle(M, d);

% 5) PageRank
r = calculerPageRank(G);  % version eig ou power iteration, au choix

% 6) Recherche + tri
query = input('Mot recherché (vide pour ignorer) : ', 's');
if ~isempty(strtrim(query))
    ranked = rechercherEtClasserV2(files, contents, r, query);

    if isempty(ranked)
        disp("Aucun fichier ne correspond à cette requête.");
    else
        disp("=== Résultats (triés par nb de mots matchés puis PageRank) ===");
        for k = 1:numel(ranked)
            i = ranked(k);
            fprintf('%d) %s\n', k, files{i});
        end
    end
end


