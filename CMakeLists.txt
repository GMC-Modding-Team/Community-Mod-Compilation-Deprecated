# Cataclysm data files
cmake_minimum_required(VERSION 3.1.4)

SET(CATACLYSM_DATA_DIRS
    ${CMAKE_SOURCE_DIR}/data/Unlesh The Mods
    ${CMAKE_SOURCE_DIR}/data/Tilesets
    ${CMAKE_SOURCE_DIR}/data/no mods
    ${CMAKE_SOURCE_DIR}/data/Obsolete+updates mods
)

IF(RELEASE)
    install(DIRECTORY ${CATACLYSM_DATA_DIRS} DESTINATION ${DATA_PREFIX})
    install(FILES ${CATACLYSM_DATA_FILES} DESTINATION ${DATA_PREFIX})
ENDIF(RELEASE)
