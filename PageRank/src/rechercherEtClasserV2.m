function ranked = rechercherEtClasserV2(files, contents, r, query)
    % - pertinence = nb de mots distincts de la requête trouvés
    % - tri : (1) pertinence desc, (2) PageRank desc
    %

    N = numel(files);

    % Tokeniser la requête en mots uniques
    qTokens = tokeniserTexte(query);
    qTokens = unique(qTokens);

    if isempty(qTokens)
        ranked = [];
        return;
    end

    % Calculer un score "nb mots matchés" pour chaque document
    matchCount = zeros(N,1);

    for i = 1:N
        docTokens = tokeniserTexte(contents{i});
        docTokens = unique(docTokens);

        % Compte combien de tokens requête sont présents dans le doc
        % ismember(a,b) -> vecteur bool pour a dans b
        present = ismember(qTokens, docTokens);
        matchCount(i) = sum(present);
    end

    % Filtrer les documents non pertinents (score=0)
    candidates = find(matchCount > 0);
    if isempty(candidates)
        ranked = [];
        return;
    end

    % On construit une matrice de clés de tri (deux colonnes)
    % sortrows trie par défaut croissant, donc on trie sur les négatifs.
    keys = [-matchCount(candidates), -r(candidates)];
    [~, ord] = sortrows(keys);

    ranked = candidates(ord);
end

