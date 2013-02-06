syn match vimfilerNonMarkedFile2     '.*'
      \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,
      \vimfilerTypeArchive,vimfilerTypeExecute,vimfilerTypeMultimedia,
      \vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
      \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek,
      \vimfilerConfigurationFile,vimfilerLogFile

syn match vimfilerConfigurationFile ' .*\.yml ' contained
syn match vimfilerConfigurationFile ' .*\.ini ' contained

syn match vimfilerLogFile ' .*\.log ' contained

hi vimfilerTypeDirectory     ctermfg=63
hi vimfilerConfigurationFile ctermfg=35
hi vimfilerLogFile           ctermfg=61
hi vimfilerTypeLink          ctermfg=5
