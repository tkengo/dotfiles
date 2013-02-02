syn match vimfilerNonMarkedFile     '.*'
      \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,
      \vimfilerTypeArchive,vimfilerTypeExecute,vimfilerTypeMultimedia,
      \vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
      \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek,
      \vimfilerSourceCode

syn match vimfilerSourceCode '.*\.rb '  contained
syn match vimfilerSourceCode '.*\.php ' contained

hi vimfilerTypeDirectory ctermfg=63
hi vimfilerSourceCode    ctermfg=208
hi vimfilerTypeLink      ctermfg=5
